-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end

-- Bootstrap machinegun.nvim
local machinepath = vim.fn.stdpath "data" .. "/lazy/machinegun.nvim"
if not vim.loop.fs_stat(machinepath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/GCBallesteros/machinegun.nvim.git", "--branch=main", machinepath })
end

vim.opt.rtp:prepend(machinepath)
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

local _, machinegun  = pcall(require,"machinegun")
local machinegun_config = require "config.machinegun"
machinegun.setup(machinegun_config)

require("lazy").setup({
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.editor.leap" },
    { import = "lazyvim.plugins.extras.ui.alpha" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.formatting.black" },
    -- { import = "lazyvim.plugins.extras.editor.symbols-outline" },
    { import = "lazyvim.plugins.extras.editor.aerial" },

    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
