-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.api.nvim_set_keymap

--------------------------
-- Disable LazyVim maps --
--------------------------
local del = vim.keymap.del
del({ "n" }, "<leader>L") -- Lazy Change Log
del("n", "<leader>`") -- Switch to other buffer
del("n", "<leader>bb") -- Switch to other buffer

-- Lazygit
-- del("n", "<leader>gg") -- If I delete I lose it for fugitive??
del("n", "<leader>gG")

-- windows
del("n", "<leader>ww")
del("n", "<leader>wd")
del("n", "<leader>w-")
del("n", "<leader>w|")
del("n", "<leader>-")
del("n", "<leader>|")

-- tabs
del("n", "<leader><tab>l")
del("n", "<leader><tab>f")
del("n", "<leader><tab><tab>")
del("n", "<leader><tab>]")
del("n", "<leader><tab>d")
del("n", "<leader><tab>[")

-- lazy
del("n", "<leader>l")

-- new file
del("n", "<leader>fn")

----------
-- Misc --
----------
-- fast saving
keymap("n", ",w", "<CMD>w<CR>", { noremap = true, silent = true, desc = "Save" })

-- fast quitting
keymap("n", ",q", "<CMD>q<CR>", { noremap = true, silent = true, desc = "Quit" })

-- Format
keymap("n", ",f", "<CMD>LazyFormat<CR>", { noremap = true, silent = true, desc = "Format" })

-- Tabs
keymap("n", "<leader><tab><tab>", "<CMD>tabNext<CR>", { noremap = true, silent = true, desc = "Next Tab" })
keymap("n", "<leader><tab>n", "<CMD>tabNext<CR>", { noremap = true, silent = true, desc = "Next Tab" })
keymap("n", "<leader><tab>p", "<CMD>tabprevious<CR>", { noremap = true, silent = true, desc = "Prevous Tab" })
keymap("n", "<leader><tab>c", "<CMD>tabclose<CR>", { noremap = true, silent = true, desc = "Close Tab" })
