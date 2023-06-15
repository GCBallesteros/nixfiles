require "bootstrap"
local hostname = require("utils").getHostname()

-- mappings from hostname -> config
local configs = {
    ["air"] = "air",
    ["air.local"] = "air",
    ["pop-os"] = "pop_os",
}

-- Read the config and if it fails go for the default
local cfg = require("config")[configs[hostname]]
if cfg == nil then
    cfg = require("config")["default"]
end

vim.g.mapleader = ","
vim.g.python3_host_prog = vim.fn.expand(cfg.python3_host .. "/python")

require "settings"
require("lazy").setup("plugins", { lockfile = "~/.config/lazy-lock.json", dev = { path = cfg.dev_plugins } })
require "functions"
require("colorschemes").colorscheme(cfg.colorscheme)
