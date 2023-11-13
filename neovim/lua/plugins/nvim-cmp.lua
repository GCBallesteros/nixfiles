return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require "cmp"
    opts.completion.completeopt = "menu,menuone,noinsert,noselect"
    opts.mapping["<CR>"] = cmp.mapping.confirm({ select = false })
    return opts
  end,
}
