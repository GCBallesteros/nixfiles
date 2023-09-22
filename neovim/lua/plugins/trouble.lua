local M = {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    {
      "<leader>xx",
      "<cmd>TroubleToggle document_diagnostics<cr>",
      desc = "Document Diagnostics",
    },
    {
      "<leader>xX",
      "<cmd>TroubleToggle workspace_diagnostics<cr>",
      desc = "Workspace Diagnostics",
    },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>", desc = "Location List" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Quickfix List" },
    { "<leader>sr", "<cmd>Trouble lsp_references<cr>", desc = "References" },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          vim.cmd.cprev()
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          vim.cmd.cnext()
        end
      end,
      desc = "Next trouble/quickfix item",
    },
  },
}

return M
