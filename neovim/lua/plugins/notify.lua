local M = {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require "notify"
    notify.setup({})
    vim.notify = notify
  end,
}

return M
