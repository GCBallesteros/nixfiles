-- A Git wrapper so awesome, it should be illegal
local M = {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  keys = {
    { "<leader>gg", "<cmd>G<cr>", desc = "Git Fugitive" },
    { "<leader>gp", "<cmd>G push<cr>", desc = "Git Push" },
    { "<leader>gb", "<cmd>G blame<cr>", desc = "Git Blame" },
    { "<leader>gd", "<cmd>Gdiffsplit!<cr>", desc = "Git Diff file" },
    { "<leader>gl", "<cmd>GcLog<cr>", desc = "Git Log" },
  },
}

return M
