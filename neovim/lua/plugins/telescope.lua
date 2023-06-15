local M = {
  "nvim-telescope/telescope.nvim",
  keys = {
    {
      ";",
      function()
        require("telescope.builtin").buffers(require("telescope.themes").get_ivy({}))
      end,
      desc = "Switch Buffers",
    },
    { "<leader>t", "<cmd>Telescope git_files<cr>", desc = "Search Git Files" },
    { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep Files" },
  },
  priority = 100,
  lazy = false,
  config = function()
    local telescope = require "telescope"
    telescope.setup({
      extensions = {
        fzy_native = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
      pickers = {
        initial_mode = "insert",
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = function(...)
                return require("telescope.actions").delete_buffer(...)
              end,
            },
            n = {
              ["dd"] = function(...)
                return require("telescope.actions").delete_buffer(...)
              end,
            },
          },
        },
      },
    })
    telescope.load_extension "fzy_native"
  end,
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzy-native.nvim" },
}

return M
