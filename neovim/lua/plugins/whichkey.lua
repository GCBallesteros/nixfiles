local M = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require "which-key"
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    wk.register({
      g = { name = "git" },
      s = { name = "lsp" },
      x = { name = "trouble" },
    }, { prefix = "<leader>" })
  end,
}

return M
