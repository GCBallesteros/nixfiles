local utils = require "../utils"

-- Collect all the colorschemes under one table
-- Each colorscheme file must return a function named colorscheme that takes
-- the subtheme and configures the colorschame via vim.cmd.colorscheme
local themes = {}
local colorscheme_folder = vim.fn.stdpath "config" .. "/lua/colorschemes"
for _, file in ipairs(vim.fn.readdir(colorscheme_folder, [[v:val =~ '\.lua$']])) do
  if file ~= "init.lua" then
    local colorscheme_name = file:gsub("%.lua$", "")
    local colorscheme_path = "colorschemes." .. colorscheme_name
    themes[colorscheme_name] = require(colorscheme_path).colorscheme
  end
end

function M.colorscheme(theme)
  local main_theme
  local subtheme
  main_theme = utils.split_string(theme, "-")[1]
  subtheme = utils.split_string(theme, "-")[2]

  themes[main_theme](subtheme)
end

return M
