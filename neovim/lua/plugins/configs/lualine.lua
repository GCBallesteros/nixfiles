local navic = require "nvim-navic"
local lualine = require "lualine"

lualine.setup({
  options = { theme = "auto" },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
      },
    },
    lualine_c = {},
    lualine_x = { "encoding", "fileformat", "filetype" },
  },
  tabline = {
    lualine_a = {},
    lualine_b = { { "filename", path = 1 } },
    lualine_c = {
      { navic.get_location, cond = navic.is_available },
    },
    lualine_x = {},
    lualine_y = { "diff" },
    lualine_z = { "branch" },
  },
})
