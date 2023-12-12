return {
  "ggandor/leap.nvim",
  enabled=false,
  keys = {
    {
      "<leader>j",
      function()
        require("leap-lines").leap_to_line_forward()
      end,
    },
    {
      "<leader>k",
      function()
        require("leap-lines").leap_to_line_backwards()
      end,
    },
  },
}
