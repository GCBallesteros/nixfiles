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
    { "]u", "<cmd>lua require('notebook-navigator').swap_cell('d')<cr>", desc = "Run Cell & Move" },
    { "[u", "<cmd>lua require('notebook-navigator').swap_cell('u')<cr>", desc = "Run Cell & Move" },
  },
  dependencies = {
    "echasnovski/mini.comment",
    "hkupty/iron.nvim",
    "anuvyklack/hydra.nvim",
  },
  dev = mg.dev.notebooknavigator,
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
