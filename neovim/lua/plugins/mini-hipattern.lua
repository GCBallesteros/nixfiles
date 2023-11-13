return {
  {
    "echasnovski/mini.hipatterns",
    dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
    event = "LazyFile",
    enabled = true,
    opts = function(_, opts)
      local nn = require "notebook-navigator"
      local cell_highlighters = { cells = nn.minihipatterns_spec }

      -- Make sure we have a place to put the highlighters
      if opts.highlighters == nil then
        opts.highlighters = {}
      end

      for k, v in pairs(cell_highlighters) do
        opts.highlighters[k] = v
      end
      return opts
    end,
  },
}
