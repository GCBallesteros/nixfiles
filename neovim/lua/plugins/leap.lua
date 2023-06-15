local M = {
  "ggandor/leap.nvim",
  keys = {
    { "<space>j", "<cmd>lua leap_to_line_forward()<cr>", desc = "Leap Line Forwards" },
    { "<space>k", "<cmd>lua leap_to_line_backwards()<cr>", desc = "Leap Line Back" },
    { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
    { "S", mode = { "n", "o" }, desc = "Leap backward to" },
    { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
  },
  config = function()
    require("leap").add_default_mappings()
  end,
}

return M
