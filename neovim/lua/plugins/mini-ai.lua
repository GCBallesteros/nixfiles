local function all_buffer_object()
  local from = { line = 1, col = 1 }
  local to = {
    line = vim.fn.line("$"),
    col = math.max(vim.fn.getline("$"):len(), 1),
  }
  return { from = from, to = to }
end

return {
  {
    "echasnovski/mini.ai",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    event = "VeryLazy",
    opts = function(_, opts)
      local nn = require("notebook-navigator")
      local extra_objects = { h = nn.miniai_spec, g = all_buffer_object }

      -- Make sure we have a place to put the custom_textobjects
      if opts.custom_textobjects == nil then
        opts.custom_textobjects = {}
      end

      for k, v in pairs(extra_objects) do
        opts.custom_textobjects[k] = v
      end
      return opts
    end,
  },
}
