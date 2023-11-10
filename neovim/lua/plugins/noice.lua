return {
  "folke/noice.nvim",
  keys = function()
    return {}
  end,
  opts = {
    cmdline = { view = "cmdline" },
    presets = { command_palette = false },

    routes = {
      {
        view = "notify",
        filter = { event = "msg_showmode" },
      },
    },
  },
}
