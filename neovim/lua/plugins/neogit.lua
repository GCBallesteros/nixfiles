return {
  "NeogitOrg/neogit",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
  },
  keys = function()
    -- Issue 864 of NeogitOrg/neogit not working anymore
    -- local function neogit_action(popup, action, args)
    --   return function()
    --     require("plenary.async").run(function()
    --       require("neogit.popups." .. popup .. ".actions")[action]({
    --         get_arguments = function()
    --           return args
    --         end,
    --       })
    --     end)
    --   end
    -- end

    return {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Git Fugitive" },
      { "<leader>gp", "<cmd>Neogit push<cr>", desc = "Git Push" },
      { "<leader>gP", "<cmd>Neogit pull<cr>", desc = "Git Push" },
      { "<leader>gl", "<cmd>Neogit log<cr>", desc = "Git Log", mode = { "n" } },
    }
  end,
  opts = {
    integrations = {
      telescope = true,
      diffview = true,
    },
  },
}
