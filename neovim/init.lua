-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Highlight group for nvim-window markeg
vim.api.nvim_set_hl(0, "NVIMWINDOW", { fg = "#000000", bg = "#f2de91" })
