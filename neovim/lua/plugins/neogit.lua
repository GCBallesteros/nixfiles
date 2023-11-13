return {
  "NeogitOrg/neogit",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "sindrets/diffview.nvim",
  },
  keys = function()
    return {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Neogit" },
      { "<leader>gP", "<cmd>Neogit push<cr>", desc = "Git Push" },
      { "<leader>gp", "<cmd>Neogit pull<cr>", desc = "Git Pull" },
      { "<leader>gl", "<cmd>Neogit log<cr>", desc = "Git Log", mode = { "n" } },
    }
  end,
  dev = false,
  opts = {
    integrations = {
      telescope = true,
      diffview = true,
    },
  },
}
