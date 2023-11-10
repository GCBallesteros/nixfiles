return {
  "sindrets/diffview.nvim",
  keys = {
    { "<leader>gdd", "<cmd>DiffviewOpen<CR>", desc = "Diff (current)" },
    {
      "<leader>ghd",
      function()
        require("github").check_pr()
      end,
      desc = "Check PR",
    },
    {
      "<leader>gdv",
      function()
        vim.ui.input({ prompt = "LeftBranch...RightBranch: " }, function(branches)
          if branches ~= nil then
            vim.cmd("DiffviewOpen " .. branches)
          end
        end)
      end,
      desc = "DiffviewOpen",
    },
    { "<leader>gdh", "<CMD>DiffviewFileHistory %<CR>", desc = "Diff file history", mode = { "n" } },
    { "<leader>gdh", "<ESC><CMD>'<,'>DiffviewFileHistory %<CR>", desc = "Diff file history range", mode = { "v" } },
  },
  config = true,
}
