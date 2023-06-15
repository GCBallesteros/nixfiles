local M = {
  "nvim-lualine/lualine.nvim",
  opts = {
    extensions = { "fugitive" },
    options = { theme = "auto" },
    sections = {
      lualine_a = { { "filename", path = 4 } },
      lualine_b = {
        {
          "diagnostics",
          symbols = { error = "  ", warn = "  ", info = "  ", hint = "  " },
          sources = { "nvim_lsp" },
        },
      },
      lualine_c = {},
      lualine_x = { "encoding", "fileformat", "filetype" },
    },
    tabline = {
      lualine_a = { "mode" },
      lualine_b = { "tabs" },
      lualine_c = {},
      lualine_x = {},
      lualine_y = { "diff" },
      lualine_z = { "branch" },
    },
  },
}

return M
