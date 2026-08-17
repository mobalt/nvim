-- Local JSON-schema store.
--
-- Common validation schemas (docker-compose, package.json, GitHub workflows,
-- ...) are pre-downloaded into stdpath("data")/schemas — in the sandbox image
-- this happens at Docker build time via `require("config.schemas").prefetch()`.
-- At runtime, `localize()` rewrites a schema URL to a file:// URI whenever a
-- local copy exists (see lua/plugins/schemas.lua), so yamlls/jsonls never
-- fetch schemas over the network. URLs must match the SchemaStore.nvim
-- catalog exactly, since the rewrite is keyed on the URL.

local M = {}

M.dir = vim.fn.stdpath("data") .. "/schemas"

-- Catalog URLs to pre-download (keep in sync with the SchemaStore catalog).
M.urls = {
  "https://raw.githubusercontent.com/compose-spec/compose-go/master/schema/compose-spec.json", -- docker-compose.yml
  "https://www.schemastore.org/package.json",
  "https://www.schemastore.org/github-workflow.json",
  "https://www.schemastore.org/github-action.json",
  "https://www.schemastore.org/tsconfig.json",
  "https://www.schemastore.org/jsconfig.json",
  "https://www.schemastore.org/eslintrc.json",
  "https://www.schemastore.org/prettierrc.json",
  "https://www.schemastore.org/dependabot-2.0.json",
  "https://www.schemastore.org/pre-commit-config.json",
  "https://gitlab.com/gitlab-org/gitlab-foss/-/raw/master/app/assets/javascripts/editor/schema/ci.json", -- gitlab-ci
  "https://golangci-lint.run/jsonschema/golangci.jsonschema.json",
  "https://taskfile.dev/schema.json",
  "https://docs.renovatebot.com/renovate-schema.json",
}

function M.local_path(url)
  return M.dir .. "/" .. url:gsub("%W", "_") .. ".json"
end

-- Rewrite a remote schema URL to a local file:// URI when a copy exists.
function M.localize(url)
  local path = M.local_path(url)
  if (vim.uv or vim.loop).fs_stat(path) then
    return "file://" .. path
  end
  return url
end

-- Resolve a possibly-relative $ref against the URL of the schema holding it.
local function resolve(base, ref)
  if ref:match("^https?://") then
    return ref
  end
  local root = base:match("^(https?://[^/]+)")
  if not root then
    return nil
  end
  if ref:sub(1, 1) == "/" then
    return root .. ref
  end
  ref = ref:gsub("^%./", "")
  local dir = base:match("^(.*)/[^/]*$") or base
  while ref:sub(1, 3) == "../" do
    ref = ref:sub(4)
    dir = dir:match("^(.*)/[^/]*$") or dir
  end
  return dir .. "/" .. ref
end

-- Download all curated schemas; run at image build time (requires network).
--
-- Schemas can `$ref` other schemas (e.g. package.json refs prettierrc.json
-- and quikrun.json, quikrun refs nodemon.json by relative path), and the
-- language servers resolve those refs from the schema body — so a
-- catalog-level rewrite alone still leaks network calls (or breaks on
-- relative refs once the base becomes a local file). To close that: crawl
-- $refs (bounded), download them too, absolutize relative refs, and rewrite
-- every downloaded URL inside the schema files to its local file:// copy.
function M.prefetch()
  vim.fn.mkdir(M.dir, "p")
  local queue = vim.deepcopy(M.urls)
  local seen, order, failed = {}, {}, {}
  local i = 1
  while i <= #queue do
    local url = queue[i]
    i = i + 1
    if not seen[url] then
      seen[url] = true
      local path = M.local_path(url)
      local out = vim.fn.system({ "curl", "-fsSL", "--retry", "2", "-o", path, url })
      if vim.v.shell_error ~= 0 then
        table.insert(failed, url .. ": " .. out)
      else
        table.insert(order, url)
        local content = table.concat(vim.fn.readfile(path), "\n")
        for ref in content:gmatch('"%$ref"%s*:%s*"([^"#]+)') do
          local abs = resolve(url, ref)
          if abs and not seen[abs] and #queue < 60 then
            table.insert(queue, abs)
          end
        end
      end
    end
  end
  -- Longest URL first, so a URL that is a prefix of another can't clobber it.
  table.sort(order, function(a, b)
    return #a > #b
  end)
  for _, url in ipairs(order) do
    local path = M.local_path(url)
    local content = table.concat(vim.fn.readfile(path), "\n")
    -- absolutize relative $refs, then point every known URL at its local copy
    content = content:gsub('("%$ref"%s*:%s*")([^"]+)', function(prefix, ref)
      if ref:sub(1, 1) == "#" or ref:match("^https?://") then
        return prefix .. ref
      end
      local base, fragment = ref:match("^([^#]*)(#?.*)$")
      return prefix .. (resolve(url, base) or base) .. fragment
    end)
    for _, u in ipairs(order) do
      content = content:gsub(vim.pesc(u), "file://" .. M.local_path(u))
    end
    vim.fn.writefile(vim.split(content, "\n"), path)
  end
  if #failed > 0 then
    error("schema prefetch failed:\n" .. table.concat(failed, "\n"))
  end
  print(("prefetched %d schemas (%d curated + %d $refs) to %s"):format(#order, #M.urls, #order - #M.urls, M.dir))
end

return M
