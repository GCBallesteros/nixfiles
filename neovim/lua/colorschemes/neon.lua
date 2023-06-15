local M = {}

local utils = require "../utils"

function M.colorscheme(subtheme)
  local g = vim.g

  if utils.has_value({ "default", "doom", "dark", "light" }, subtheme) then
    g.neon_style = subtheme
  else
    g.neon_style = "default"
  end

  g.neon_italic_keyword = true
  g.neon_italic_function = true
  g.neon_transparent = false

  vim.cmd.colorscheme "neon"
end

return M
