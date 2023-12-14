return {
  global = "mg",
  default = "work_desktop",
  machines = { m2 = "86a39a1a", work_desktop = "c4cd42bf", ds_machine = "ad5e10eb" },
  settings = {
    ["guillem@m2"] = {
      colorscheme = "tokyonight",
      whaler = {
        directories = { { path = "/Users/guillem/projects", alias = "plugins" } },
        oneoff_directories = { { path = "/Users/guillem/Documents/Projects/nanochess", alias = "Random project" } },
      },
      dev = { neogit = false, notebooknavigator = true },
    },
    ["root@m2"] = { colorscheme = "catppuccin-latte" },
    ["work_desktop"] = { colorscheme = "tokyonight" },
    ["ds_machine"] = {
      colorscheme = "rose-pine",
      whaler_folders = {
        directories = { { path = "/home/guillem/Work/spacelab", alias = "spacelab" } },
        oneoff_directories = { { path = "/home/guillem/Work/spacelab/dev-tools/lab/optics" } },
      },
      dev = { neogit = false, notebooknavigator = false },
    },
    ["root@ds_machine"] = { colorscheme = "miasma" },
  },
}
