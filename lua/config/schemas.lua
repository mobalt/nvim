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

-- Download all curated schemas; run at image build time (requires network).
function M.prefetch()
  vim.fn.mkdir(M.dir, "p")
  local failed = {}
  for _, url in ipairs(M.urls) do
    local out = vim.fn.system({ "curl", "-fsSL", "--retry", "2", "-o", M.local_path(url), url })
    if vim.v.shell_error ~= 0 then
      table.insert(failed, url .. ": " .. out)
    end
  end
  if #failed > 0 then
    error("schema prefetch failed:\n" .. table.concat(failed, "\n"))
  end
  print(("prefetched %d schemas to %s"):format(#M.urls, M.dir))
end

return M
