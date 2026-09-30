-- :UpdateAll — the one place this config touches the network after the
-- initial install. Updates plugins (and runs their builds), treesitter
-- parsers, the mason registry, and any outdated mason packages.
vim.api.nvim_create_user_command("UpdateAll", function()
  require("lazy").sync({ wait = true, show = true })
  vim.cmd("TSUpdate")

  local mr = require("mason-registry")
  mr.update(vim.schedule_wrap(function(ok, err)
    if not ok then
      return vim.notify("Mason registry update failed: " .. vim.inspect(err), vim.log.levels.ERROR)
    end
    local outdated = {}
    for _, pkg in ipairs(mr.get_installed_packages()) do
      if pkg:get_installed_version() ~= pkg:get_latest_version() and not pkg:is_installing() then
        table.insert(outdated, pkg.name)
        pkg:install()
      end
    end
    local msg = #outdated > 0 and ("Updating mason packages: " .. table.concat(outdated, ", "))
      or "Mason packages are up to date"
    vim.notify(msg)
  end))
end, { desc = "Update plugins, treesitter parsers and mason packages" })
