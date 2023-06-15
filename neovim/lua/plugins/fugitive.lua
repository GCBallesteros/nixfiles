-- A Git wrapper so awesome, it should be illegal
local M = {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  keys = {
    { "<leader>gg", "<cmd>G<cr>", desc = "Git Fugitive" },
    { "<leader>gp", "<cmd>G push<cr>", desc = "Git Push" },
    { "<leader>gb", "<cmd>G blame<cr>", desc = "Blame" },
  },
}

return M
