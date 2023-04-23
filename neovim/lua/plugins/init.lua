local fn = vim.fn

-- Automatically install packer on initial startup
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_Bootstrap =
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
  print "---------------------------------------------------------"
  print "Press Enter to install packer and plugins."
  print "After install -- close and reopen Neovim to load configs!"
  print "---------------------------------------------------------"
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call
local present, packer = pcall(require, "packer")

if not present then
  return
end

plugins = require("plugin_list").plugins
-- nil it so that we don't use the cache when the autocommand
-- runs making changes invisible
package.loaded["plugin_list"] = nil

packer.startup(function(use)
  for _, plugin in ipairs(plugins) do
    use(plugin)
  end

  if Packer_Bootstrap then
    require("packer").sync()
  end
end)

-- Require all the plugin specific configurations
local plugin_config_folder = vim.fn.stdpath "config" .. "/lua/plugins/configs"
for _, file in ipairs(vim.fn.readdir(plugin_config_folder, [[v:val =~ '\.lua$']])) do
  require("plugins/configs/" .. file:gsub("%.lua$", ""))
end

-- Wilder is configured in vimscript so it breaks the pattern
vim.cmd.source "~/.config/nvim/lua/plugins/configs/wilder.vim"
