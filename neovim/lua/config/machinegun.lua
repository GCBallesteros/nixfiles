return {
  global = "mg",
  default = "work_desktop",
  machines = { m2 = "86a39a1a", work_desktop = "c4cd42bf", ds_machine = "ad5e10eb" },
  settings = {
    ["guillem@m2"] = {
      {
        colorscheme = "rose-pine",
        whaler_folders = {
          { path = "/Users/guillem/projects", alias = "plugins" },
        },
      },
    },
    ["root@m2"] = { colorscheme = "catppuccin-latte" },
    ["work_desktop"] = { colorscheme = "tokyonight" },
    ["ds_machine"] = {
      colorscheme = "rose-pine",
      whaler_folders = {

        { path = "/home/guillem/Work/spacelab", alias = "spacelab" },
        { path = "=/home/guillem/Work/spacelab/dev-tools/lab/optics" },
      },
    },
    ["root@ds_machine"] = { colorscheme = "miasma" },
  },
}
