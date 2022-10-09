require "plugins"
require "settings"
require "commands"
require("colors/" .. require("config").colorscheme)

vim.g.python3_host_prog = vim.fn.expand(require("config").python3_host .. "/python")
