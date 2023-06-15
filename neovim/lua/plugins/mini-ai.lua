local function all_buffer_object()
  local from = { line = 1, col = 1 }
  local to = {
    line = vim.fn.line "$",
    col = math.max(vim.fn.getline("$"):len(), 1),
  }
  return { from = from, to = to }
end

return {
  "echasnovski/mini.ai",
  version = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "GCBallesteros/NotebookNavigator.nvim",
  },
  opts = function()
    local ai = require "mini.ai"
    local nn = require "notebook-navigator"
    return {
      n_lines = 500,
      custom_textobjects = {
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
        g = all_buffer_object,
        h = nn.miniai_spec,
      },
    }
  end,
  config = function(_, opts)
    require("mini.ai").setup(opts)
  end,
}
