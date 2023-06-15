local M = {}

local utils = require "../utils"

function M.colorscheme(subtheme)
  if utils.has_value({ "latte", "frappe", "macchiato", "mocha" }, subtheme) then
    vim.g.catppuccin_flavour = subtheme
  else
    vim.g.catppuccin_flavour = "latte"
  end

  vim.cmd.colorscheme "catppuccin"

  vim.cmd [[
 highlight Cursor guifg=white guibg=black
 highlight iCursor guifg=white guibg=steelblue
 set guicursor=n-v-c:block-Cursor
 set guicursor+=i:ver100-iCursor
 set guicursor+=n-v-c:blinkon0
 set guicursor+=i:blinkwait10
 set cursorcolumn
]]
end

return M
