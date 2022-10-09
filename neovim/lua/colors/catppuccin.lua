local g = vim.g

g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
  compile = {
    enabled = true,
  },
  integrations = {
    cmp = true,
    telescope = true,
    nvimtree = {
      enabled = false,
    },
    dashboard = false,
    lightspeed = true,
  },
})

vim.api.nvim_command "colorscheme catppuccin"

vim.cmd [[
 highlight Cursor guifg=white guibg=black
 highlight iCursor guifg=white guibg=steelblue
 set guicursor=n-v-c:block-Cursor
 set guicursor+=i:ver100-iCursor
 set guicursor+=n-v-c:blinkon0
 set guicursor+=i:blinkwait10
]]
