local opt = vim.opt

-- Colors
opt.termguicolors = true

-- Indenting
opt.expandtab = true -- use spaces
opt.shiftwidth = 4 -- tabs are 4 spaces
opt.smartindent = true -- autoindent

-- Line Numbers
opt.number = true -- use line numbers
opt.relativenumber = true
opt.numberwidth = 2 -- space for the numbers
opt.ruler = true -- shoe line number and column on status if nothing else
opt.colorcolumn = { 87 } -- columns to highlight
opt.scrolloff = 5 -- space to leave on the bottom when scrolling down
opt.cursorline = true -- highlight the line the cursor is on
opt.hidden = true -- don't lose info when unloading buffers
opt.signcolumn = "auto:2-5" -- show sign column always

vim.wo.wrap = false -- don't wrap lines

opt.laststatus = 2 -- 2: the last window will always have a status line

opt.jumpoptions = "stack"

-- Searching
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Folding options
opt.foldlevelstart = 99
opt.foldlevel = 99
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldcolumn = "1"
opt.foldnestmax = 2

opt.timeoutlen = 300
