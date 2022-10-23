return {
  -- Colorscheme: neon / tokyonight / catppuccin / material
  colorscheme = "material",
  python3_host = "~/.pyenv/versions/neovim3/bin",
  startify_repos = {
    {
      line = "TTTR Toolbox",
      path = "~/Documents/RandomProjects/tttr-toolbox/tttr-toolbox/src/main.rs",
    },
  },
  startify_bookmarks = {
    vim.env.MYVIMRC,
    "~/.zshrc",
    "~/.todo.txt"
  },
}
