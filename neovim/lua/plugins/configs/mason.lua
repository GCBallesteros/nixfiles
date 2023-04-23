require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "pyright" },
})
require("mason-tool-installer").setup({
  ensure_installed = { "stylua", "black", "isort", "ruff" },
})
