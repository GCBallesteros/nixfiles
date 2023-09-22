-- I want buffers to have fuzzy search
-- I want buffers to open already in fuzzy search mode
local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>bb",
      "<cmd>Neotree position=float source=buffers<cr>",
      desc = "Buffers (NeoTree)",
    },
    { "-", "<cmd>Neotree source=filesystem position=current reveal<cr>", desc = "NeoTree" },
    { "_", "<cmd>Neotree close<cr>", desc = "Close NeoTree" },
    { "<leader>ss", "<cmd>Neotree source=document_symbols<cr>", desc = "Tree Symbols" },
  },
  config = function()
    local neotree = require "neo-tree"
    neotree.setup({
      -- close neotree after opening a file
      event_handlers = {
        {
          event = "file_opened",
          handler = function(_) -- receive the file_path
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
      -- This are the overall keymappings that may be overriden for individual sources
      sources = { "filesystem", "buffers", "document_symbols" },
      window = {
        mappings = {
          ["C"] = "close_node",
          ["<space>"] = "noop",
          ["P"] = "noop",
          ["l"] = "noop",
          ["[g"] = "noop",
          ["]g"] = "noop",
          ["y"] = "noop",
          ["x"] = "noop",
          ["p"] = "noop",
          ["m"] = "noop",
          ["od"] = "noop",
          -- I want s/S free for leap.nvim
          ["s"] = "noop",
          ["S"] = "noop",
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true, -- This will find and focus the file in the active buffer every time
          --              -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
      -- buffers = { window = { mappings = { ["v"] = "fuzzy_finder" } } },
    })
  end,
}
return M
