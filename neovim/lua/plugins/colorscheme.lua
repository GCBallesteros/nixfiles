return {
  { "rose-pine/neovim", priority = 1000, name = "rose-pine", opts = { variant = "moon" } },
  { "catppuccin", priority = 1000, opts = { integrations = { leap = true, symbols_outline = true } } },
  {
    "LazyVim/LazyVim",
    dependencies = { "GCBallesteros/machinegun.nvim" },
    opts = function(_, opts)
      opts.colorscheme = mg.colorscheme
      return opts
    end,
  },
}
