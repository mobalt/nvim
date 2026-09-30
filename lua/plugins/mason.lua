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
}
