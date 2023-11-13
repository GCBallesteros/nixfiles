return {
  "GCBallesteros/nvim-window",
  keys = {
    { "<leader>w", "<cmd>lua require('nvim-window').pick()<CR>", desc = "Jump Window" },
  },
  opts = {
    normal_hl = "NVIMWINDOW",
    hint_hl = "Bold",
    border = "none",
    chars = { "j", "k", "l", "u", "i", "o", "n", "m", "p", "q" },
  },
}
