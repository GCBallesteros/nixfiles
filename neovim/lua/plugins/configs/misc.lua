local g = vim.g

----------------
-- Treesitter --
----------------
require("nvim-treesitter.configs").setup({
  ensure_installed = { "python", "rust", "julia", "lua", "c", "norg", "nix" },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {}, -- list of language that will be disabled
  },
})

-----------------
-- nvim-window --
-----------------
-- stylua: ignore start
local nvim_chars = {
  "j", "k", "l", "u", "i", "o",
  "n", "m", "p", "q", "r", "s",
  "t", "u", "v", "w", "x", "y", "z",
}
-- stylua: ignore end
require("nvim-window").setup({
  normal_hl = "NVIMWINDOW",
  hint_hl = "Bold",
  border = "none",
  chars = nvim_chars,
})

-----------
-- Marks --
-----------
require("marks").setup({
  default_mappings = false,
})

------------
-- Rooter --
------------
g.rooter_manual_only = 1

---------------
-- Iron.nvim --
---------------
local iron = require "iron.core"
iron.setup({
  config = {
    should_map_plug = false,
    scratch_repl = true,
    repl_definition = {
      python = {
        command = { "ipython" },
        format = require("iron.fts.common").bracketed_paste,
      },
    },
  },
  keymaps = {
    send_motion = "ctr",
    visual_send = "ctr",
  },
})

--------------
-- Jupytext --
--------------
g.jupytext_fmt = "py:hydrogen"

-------------------
-- Nerdcommenter --
-------------------
g.NERDCreateDefaultMappings = 1

--------------------
-- nvim-colorizer --
--------------------
-- colorizers needs termguicolors to load correctly
vim.opt.termguicolors = true
require("colorizer").setup({
  "css",
  "javascript",
  "html",
  "python",
  "lua",
})

--------------
-- dressing --
--------------
require("dressing").setup({})

-----------------
-- notify-nvim --
-----------------
local notify = require "notify"
notify.setup({})
vim.notify = notify

------------------
-- trouble.nvim --
------------------
require("trouble").setup({})

---------
-- UFO --
---------
-- Better folding
local ufo_handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ("  %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

-- global handler
-- `handler` is the 2nd parameter of `setFoldVirtTextHandler`,
-- check out `./lua/ufo.lua` and search `setFoldVirtTextHandler` for detail.
require("ufo").setup({
  fold_virt_text_handler = ufo_handler,
})
