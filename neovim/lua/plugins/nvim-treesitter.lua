-- Language parsing completion engine
local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "python",
      "c",
      "cpp",
      "javascript",
      "typescript",
      "sql",
      "bash",
      "go",
      "rust",
      "lua",
      "markdown",
      "markdown_inline",
      "json",
      "html",
    },
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = {}, -- list of language that will be disabled
    },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

return M
