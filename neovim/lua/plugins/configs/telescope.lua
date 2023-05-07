require("telescope").setup({
  extensions = {
    fzy_native = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    project = {
      base_dirs = require("config").project_folders,
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      -- default for on_project_selected = find project files
      --on_project_selected = function(prompt_bufnr)
      ---- Do anything you want in here. For example:
      --project_actions.change_working_directory(prompt_bufnr, false)
      --require("harpoon.ui").nav_file(1)
      --end
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
require("telescope").load_extension "fzy_native"
require("telescope").load_extension "project"
