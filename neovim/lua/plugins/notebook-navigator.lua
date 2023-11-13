return {
  "GCBallesteros/NotebookNavigator.nvim",
  keys = {
    {
      "]h",
      function()
        require("notebook-navigator").move_cell "d"
      end,
      desc = "Move Cell Down",
    },
    {
      "[h",
      function()
        require("notebook-navigator").move_cell "u"
      end,
      desc = "Move Cell Up",
    },
    { ",x", "<cmd>lua require('notebook-navigator').run_cell()<cr>", desc = "Run Cell" },
    { "]x", "<cmd>lua require('notebook-navigator').run_and_move()<cr>", desc = "Run Cell & Move" },
  },
  dependencies = {
    "echasnovski/mini.comment",
    "hkupty/iron.nvim",
    "anuvyklack/hydra.nvim",
  },
  dev = true,
  event = "VeryLazy",
  config = function()
    local nn = require "notebook-navigator"
    nn.setup({
      activate_hydra_keys = "<leader>h",
      repl_provider = "iron",
      hydra_keys = { comment = nil },
    })
  end,
}
