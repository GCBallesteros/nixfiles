local M = {}

local utils = require "../utils"

function M.colorscheme(subtheme)
  if utils.has_value({ "palenight", "oceanic", "lighter", "darker", "deep ocean" }, subtheme) then
    vim.g.material_style = subtheme
  else
    vim.g.material_style = "palenight"
  end

  vim.cmd.colorscheme "material"
end

return M
