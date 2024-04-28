-- bootstrap lazy.nvim, LazyVim and your plugins
vim.g.python3_host_prog = "/Users/guillem/.pyenv/versions/molten-nvim/bin/python3"

require "config.lazy"

-- Highlight group for nvim-window markeg
vim.api.nvim_set_hl(0, "NVIMWINDOW", { fg = "#000000", bg = "#a2de91" })
