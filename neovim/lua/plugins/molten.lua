return {
  "benlubas/molten-nvim",
  build = ":UpdateRemotePlugins",
  init = function()
    -- these are examples, not defaults. Please see the readme
    -- vim.g.molten_output_win_max_height = 20
    -- vim.g.molten_auto_open_output = false
    -- vim.g.molten_virt_lines_off_by_1 = true
    -- vim.g.molten_output_crop_border = true
    -- vim.g.molten_output_virt_lines=true
    -- vim.g.molten_output_win_hide_on_leave=false
    -- vim.g.molten_virt_text_output=true
    -- benlubas config
    -- vim.g.molten_auto_open_output = true
    -- vim.g.molten_image_provider = "image.nvim"
    -- vim.g.molten_output_crop_border = true
    -- vim.g.molten_output_show_more = true
    -- vim.g.molten_output_win_border = { "", "━", "", "" }
    -- vim.g.molten_output_win_max_height = 12
    -- vim.g.molten_output_virt_lines = true
    -- vim.g.molten_virt_text_output = false
    -- vim.g.molten_use_border_highlights = true
    -- vim.g.molten_virt_lines_off_by_1 = true
    -- vim.g.molten_wrap_output = true
  end,
}
