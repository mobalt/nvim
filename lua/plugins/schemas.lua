-- Serve JSON/YAML validation schemas from the local store when available.
--
-- The LazyVim yaml/json extras query SchemaStore.nvim lazily when yamlls and
-- jsonls start (`before_init`), so wrapping the two schema functions when the
-- plugin loads is enough to intercept every schema either server sees. URLs
-- with a pre-downloaded copy (see lua/config/schemas.lua) are rewritten to
-- file:// URIs; anything else passes through untouched.
return {
  {
    "b0o/SchemaStore.nvim",
    config = function()
      local store = require("config.schemas")
      local ss = require("schemastore")
      local orig_json, orig_yaml = ss.json.schemas, ss.yaml.schemas
      ss.json.schemas = function(...)
        local list = orig_json(...)
        for _, s in ipairs(list) do
          s.url = store.localize(s.url)
        end
        return list
      end
      ss.yaml.schemas = function(...)
        local out = {}
        for url, filematch in pairs(orig_yaml(...)) do
          out[store.localize(url)] = filematch
        end
        return out
      end
    end,
  },
}
