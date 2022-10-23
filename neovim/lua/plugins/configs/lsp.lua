local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local navic_attach = function(client, bufnr)
  require("nvim-navic").attach(client, bufnr)
end

local lspconfig = require "lspconfig"

-- Python
lspconfig.pyright.setup({
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    navic_attach(client, bufnr)
    require("settings/keymap").enable_lsp_keymaps()
  end,
})

-- Rust
lspconfig.rust_analyzer.setup({
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    navic_attach(client, bufnr)
    require("settings/keymap").enable_lsp_keymaps()
  end,
})

-- Lua
require("lspconfig").sumneko_lua.setup({
  settings = {
    Lua = {
      completion = {
        keywordSnippet = "Disable",
      },
      diagnostics = {
        globals = { "vim", "use" },
        disable = { "lowercase-global" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
      },
    },
  },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    require("settings/keymap").enable_lsp_keymaps()
    navic_attach(client, bufnr)
  end,
})
