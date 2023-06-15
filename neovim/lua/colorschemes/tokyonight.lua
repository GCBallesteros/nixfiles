local M = {}

local utils = require "../utils"

function M.colorscheme(subtheme)
  if utils.has_value({ "day", "night", "storm", "moon" }, subtheme) then
    vim.cmd.colorscheme("tokyonight-" .. subtheme)
  else
    vim.cmd.colorscheme "tokyonight"
  end
end

return M
