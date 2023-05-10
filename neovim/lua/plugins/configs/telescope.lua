local telescope = require "telescope"

local project_actions = require "telescope._extensions.project.actions"

telescope.setup({
  extensions = {
    fzy_native = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
    },
    project = {
      base_dirs = require("config").project_folders,
      hidden_files = false,
      theme = "dropdown",
      order_by = "asc",
      search_by = "title",
      on_project_selected = function(prompt_bufnr)
        project_actions.change_working_directory(prompt_bufnr, false)
        require("telescope.builtin").find_files()
      end,
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
telescope.load_extension "project"
