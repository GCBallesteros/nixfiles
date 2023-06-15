M = {}

-- Colorscheme: neon / tokyonight / catppuccin / material
M.air = {
  colorscheme = "tokyonight-storm",
  python3_host = "~/.pyenv/versions/neovim3/bin",
  project_folders = {
    "~/Documents/personal_repos",
  },
  dev_plugins = "~/Documents/personal_repos/",
}

M.default = {
  colorscheme = "catppuccin",
  python3_host = "~/.pyenv/versions/neovim3/bin",
  project_folders = {
    "~/Documents",
  },
  dev_plugins = "~/Documents/personal_repos/",
}

M.pop_os = {
  colorscheme = "catppuccin",
  python3_host = "~/.pyenv/versions/neovim3/bin",
  project_folders = {
    "~/Documents",
  },
  dev_plugins = "~/Documents/",
}

return M
