require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "sumneko_lua", "rust_analyzer", "pyright" },
})
require("mason-tool-installer").setup({
  ensure_installed = { "stylua", "black", "isort", "flake8" },
})
