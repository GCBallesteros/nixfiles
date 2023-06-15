return {
  "echasnovski/mini.bufremove",
  version = "*",
  cmd = "BD",
  config = function()
    local bufremove = require "mini.bufremove"
    bufremove.setup({})
    vim.api.nvim_create_user_command("BD", function(_)
      bufremove.delete()
    end, { nargs = 0 })
  end,
}
