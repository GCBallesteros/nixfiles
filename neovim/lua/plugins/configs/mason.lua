require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "ruff-lsp" },
})
require("mason-tool-installer").setup({
  ensure_installed = { "stylua", "black", "isort", "flake8" },
})
