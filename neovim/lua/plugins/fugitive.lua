-- A Git wrapper so awesome, it should be illegal
return {
  "tpope/vim-fugitive",
  enabled = false,
  event = "VeryLazy",
  keys = {
    { "<leader>gL", ":GcLog<cr>", desc = "Git Log", mode = { "n", "v" } },
  },
}
