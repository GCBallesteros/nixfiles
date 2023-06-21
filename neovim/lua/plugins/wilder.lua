return {
  "gelguy/wilder.nvim",
  dependencies = { "romgrk/fzy-lua-native" },
  config = function()
    vim.cmd [[
        call wilder#enable_cmdline_enter()
        set wildcharm=<c-n>
    ]]
    local wilder = require "wilder"

    wilder.setup({
      modes = { ":" },
      next_key = "<c-n>",
      previous_key = "<c-p>",
      accept_key = "<c-D>",
    })

    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline({
          fuzzy = 2,
          fuzzy_filter = wilder.lua_fzy_filter(),
        }),
        wilder.python_search_pipeline({ dir_command = { "fd", "-td" }, pattern = "fuzzy" })
      ),
    })

    local highlighters = {
      wilder.lua_fzy_highlighter(),
      wilder.basic_highlighter(),
    }

    local popupmenu_renderer = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
      border = "rounded",
      min_width = "80%",
      min_height = "0%",
      max_height = "30%",
      highlights = {
        accent = wilder.make_hl(
          "WilderAccent",
          "Pmenu",
          { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
        ),
      },
      reverse = 0,
      highlighter = highlighters,
      left = {
        " ",
        wilder.popupmenu_devicons(),
      },
      right = {
        " ",
        wilder.popupmenu_scrollbar(),
      },
    }))

    wilder.set_option("renderer", popupmenu_renderer)
  end,
}
