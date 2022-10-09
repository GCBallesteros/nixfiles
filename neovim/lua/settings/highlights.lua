local hi = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

function do_custom_hi()
  -- Highlight Hydrogen jupyter cell delimiter
  hi("HYDROGEN", { fg = "#000000", bg = "#DDDDDD" })

  -- Highlight group for nvim-window markeg
  hi("NVIMWINDOW", { fg = "#000000", bg = "#f2de91" })

  -- Highlight groups for cmp
  hi("CmpItemAbbrMatch", { fg = "#569cd6", ctermfg = 74 })
  hi("CmpItemAbbrMatchFuzzy", { fg = "#569cd6", ctermfg = 74 })

  hi("CmpItemKindVariable", { fg = "#9cdcfe", ctermfg = 158 })
  hi("CmpItemKindInterface", { fg = "#9cdcfe", ctermfg = 134 })
  hi("CmpItemKindText", { fg = "#9cdcfe", ctermfg = 187 })

  hi("CmpItemKindFunction", { fg = "#c586c0", ctermfg = 38 })
  hi("CmpItemKindMethod", { fg = "#c586c0", ctermfg = 39 })

  hi("CmpItemKindKeyword", { fg = "#d4d4d4", ctermfg = 38 })
  hi("CmpItemKindProperty", { fg = "#d4d4d4", ctermfg = 38 })
  hi("CmpItemKindUnit", { fg = "#d4d4d4", ctermfg = 38 })
end

return { do_custom_hi = do_custom_hi }
