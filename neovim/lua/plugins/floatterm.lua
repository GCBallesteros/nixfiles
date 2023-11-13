return {
  "voldikss/vim-floaterm",
  keys = {
    { "<F3>", "<CMD>FloatermToggle<CR>", desc = "Toggle Term", mode = "n" },
    { "<F3>", "<F3><C-\\><C-N><CMD>FloatermToggle<CR>", desc = "Toggle Term", mode = "t" },
    { "<C-f>", "<CMD>FloatermNext<CR>", desc = "Next Term", mode = "t" },
  },
  config = function()
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_title = "$1/$2"
  end,
}
