return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      compile = {
        enabled = true,
      },
      integrations = {
        cmp = true,
        telescope = true,
        nvimtree = true,
        treesitter = true,
        dashboard = false,
        alpha = true,
        leap = true,
        notify = true,
        lsp_trouble = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    })
  end,
}
