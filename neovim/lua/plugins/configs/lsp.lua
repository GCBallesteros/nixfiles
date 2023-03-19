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
lspconfig.ruff_lsp.setup({
  on_attach = function(client, bufnr)
    -- Disable hover in favor of Pyright
    client.server_capabilities.hoverProvider = false
  end,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    },
  },
})

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
require("lspconfig").lua_ls.setup({
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
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    require("settings/keymap").enable_lsp_keymaps()
    navic_attach(client, bufnr)
  end,
})
