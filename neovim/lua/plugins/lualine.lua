return {
  "nvim-lualine/lualine.nvim",
  -- dependencies = { "GCBallesteros/machinegun.nvim" },
  opts = function(_, opts)
    -- local machine_settings = require("machinegun").settings
    Util = require("lazyvim.util")
    local lualine_require = require("lualine_require")

    lualine_require.require = require

    local icons = require("lazyvim.config").icons

    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        section_separators = { left = "", right = "" },
        component_separators = "|",
      },
      tabline = {
        lualine_a = { "tabs" },
        lualine_y = {
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
          },
        },
        lualine_z = { "branch" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "", right = "" }, right_padding = 2 },
        },
        lualine_b = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
        },
        lualine_c = {
          Util.lualine.root_dir(),
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          {
            Util.lualine.pretty_path(),
          },
        },
        lualine_x = {},
        lualine_y = {
          { "fileformat" },
          { "progress", separator = " ", padding = { left = 1, right = 1 } },
        },
        lualine_z = { "location" },
      },
      extensions = { "fugitive", "lazy" },
    }
  end,
}
