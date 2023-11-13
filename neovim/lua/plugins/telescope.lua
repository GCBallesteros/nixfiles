return {
  "nvim-telescope/telescope.nvim",
  keys = function()
    return {
      {
        ";",
        function()
          require("telescope.builtin").buffers(require("telescope.themes").get_ivy({}))
        end,
        desc = "Switch Buffers",
      },
      { "<leader>t", "<cmd>Telescope git_files<cr>", desc = "Search Git Files" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep Files" },
      {
        "<leader>ss",
        function()
          require("telescope.builtin").lsp_document_symbols({
            symbols = require("lazyvim.config").get_kind_filter(),
          })
        end,
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        function()
          require("telescope.builtin").lsp_dynamic_workspace_symbols({
            symbols = require("lazyvim.config").get_kind_filter(),
          })
        end,
        desc = "Goto Symbol (Workspace)",
      },
    }
  end,
  opts = function()
    return {
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
      extensions = {
        whaler = {
          directories = mg.whaler_folders,
        },
      },
    }
  end,
}
