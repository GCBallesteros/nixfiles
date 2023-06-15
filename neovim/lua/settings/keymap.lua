local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

-- Modes:
--   Normal       = "n"
--   Insert       = "i"
--   Visual       = "v"
--   Visual_Block = "x"
--   Terminal     = "t"
--   Command      = "c"

--------------
-- Terminal --
--------------
-- Floating terminal shortcuts
keymap("n", "<F3>", "<CMD>FloatermToggle<CR>", opts)
keymap("t", "<F3>", "<F3><C-\\><C-N><CMD>FloatermToggle<CR>", opts)
keymap("t", "<C-f>", "<CMD>FloatermNext<CR>", opts)

-- Escape terminal key with ESC
keymap("t", "<ESC>", "<C-\\><C-n>", opts)

----------
-- Misc --
----------
-- fast saving
keymap("n", "<leader>w", "<CMD>w<CR>", opts)

-- fast quitting
keymap("n", "<leader>q", "<CMD>q<CR>", opts)

-- clear highlighting
keymap("n", "<CR>", "<Plug>(LoupeClearHighlight)", { noremap = false, silent = true })

--quickfix movement
keymap("n", "]q", "<cmd>cn<CR>", opts)
keymap("n", "[q", "<cmd>cp<CR>", opts)

local M = {}

M.enable_lsp_keymaps = function()
  keymap("n", "<c-]>", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  keymap("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

  keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
end

return M
