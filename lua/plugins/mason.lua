-- Keep mason.nvim from phoning home on startup.
--
-- Both LazyVim's mason config and mason-lspconfig call `registry.refresh()`
-- on every start, which re-downloads the package registry from GitHub once
-- the local copy is older than 24h. Once a registry has been installed (on
-- the first, online run), treat it as fresh forever; `:MasonUpdate` (or
-- `:UpdateAll`) still updates it explicitly via `registry.update()`.
return {
  {
    "mason-org/mason.nvim",
    -- opts runs when the plugin loads, before LazyVim's config calls refresh
    opts = function()
      local mr = require("mason-registry")
      local refresh = mr.refresh
      mr.refresh = function(callback)
        local state = require("mason-registry.installer").get_registry_state()
        if state and mr.sources:is_all_installed() then
          if callback then
            callback(true, {})
          end
          return
        end
        return refresh(callback)
      end
    end,
  },
  {
    -- The markdown extra asks mason to install markdown-toc, but its npm
    -- dependency toml@2.3.6 is blocked by the sandbox's supply-chain proxy
    -- (known high-severity CVEs). Skip it so startup doesn't retry the
    -- install; conform simply skips formatters that aren't installed.
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "markdown-toc"
      end, opts.ensure_installed or {})
    end,
  },
}
