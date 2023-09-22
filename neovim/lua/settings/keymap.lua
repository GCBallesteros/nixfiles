local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
local utils = require "utils"

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

local add_description = function(opts, desc)
  return utils.merge_opts(opts, { desc = desc })
end
----------
-- Misc --
----------
-- fast saving
keymap("n", "<leader>w", "<CMD>w<CR>", add_description(opts, "Save"))

-- fast quitting
keymap("n", "<leader>q", "<CMD>q<CR>", add_description(opts, "Quit"))

-- clear highlighting
keymap(
  "n",
  "<CR>",
  "<Plug>(LoupeClearHighlight)",
  { noremap = false, silent = true, desc = "Clear Highlights" }
)

--quickfix movement
keymap("n", "]q", "<cmd>cn<CR>", opts)
keymap("n", "[q", "<cmd>cp<CR>", opts)

local M = {}

M.enable_lsp_keymaps = function()
  keymap(
    "n",
    "<leader>sd",
    "<cmd>lua vim.lsp.buf.definition()<CR>",
    add_description(opts, "Jump To Definition")
  )
  keymap("n", "<leader>sk", "<cmd>lua vim.lsp.buf.hover()<CR>", add_description(opts, "Hover"))
  keymap("n", "<leader>sa", "<cmd>lua vim.lsp.buf.code_action()<CR>", add_description(opts, "Code Action"))
  keymap("n", "<Leader>sn", "<cmd>lua vim.lsp.buf.rename()<CR>", add_description(opts, "Rename"))
  keymap(
    "n",
    "<leader>si",
    "<cmd>lua vim.lsp.buf.implementation()<CR>",
    add_description(opts, "Jump To Implementation")
  )

  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

  keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", add_description(opts, "Format Buffer"))
end

return M
