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

-- TrailBlazer
--require("trailblazer").setup({
  --lang = "en",
  --trail_options = {
    --trail_mark_priority = 10001,
    ---- Available modes to cycle through. Remove any you don't need.
    --available_trail_mark_modes = {
      --"global_chron",
      --"global_buf_line_sorted",
      --"global_fpath_line_sorted",
      --"global_chron_buf_line_sorted",
      --"global_chron_fpath_line_sorted",
      --"global_chron_buf_switch_group_chron",
      --"global_chron_buf_switch_group_line_sorted",
      --"buffer_local_chron",
      --"buffer_local_line_sorted",
    --},
    --available_trail_mark_stack_sort_modes = {
      --"alpha_asc", -- alphabetical ascending
      --"alpha_dsc", -- alphabetical descending
      --"chron_asc", -- chronological ascending
      --"chron_dsc", -- chronological descending
    --},
    ---- The current / initially selected trail mark stack sort mode. Choose from one of the
    ---- available modes: alpha_asc, alpha_dsc, chron_asc, chron_dsc
    --current_trail_mark_stack_sort_mode = "alpha_asc",
    ---- Set this to true if you always want to move to the nearest trail mark first before
    ---- continuing to peek move in the current selection mode order. This effectively disables
    ---- the "current trail mark cursor" to which you would otherwise move first before continuing
    ---- to move through your trail mark stack.
    --move_to_nearest_before_peek = false,
    --move_to_nearest_before_peek_motion_directive_up = "fpath_up", -- "up", "fpath_up" -> For more information see section "TrailBlazerMoveToNearest Motion Directives"
    --move_to_nearest_before_peek_motion_directive_down = "fpath_down", -- "down", "fpath_down" -> For more information see section "TrailBlazerMoveToNearest Motion Directives"
    --move_to_nearest_before_peek_dist_type = "lin_char_dist", -- "man_dist", "lin_char_dist" -> Manhattan Distance or Linear Character Distance
  --},
  --mappings = { -- rename this to "force_mappings" to completely override default mappings and not merge with them
    --nv = { -- Mode union: normal & visual mode. Can be extended by adding i, x, ...
      --motions = {
        --new_trail_mark = "<A-l>",
        --track_back = "<A-b>",
        --peek_move_next_down = "<A-J>",
        --peek_move_previous_up = "<A-K>",
        --move_to_nearest = "<A-n>",
        --toggle_trail_mark_list = "<A-m>",
      --},
      --actions = {
        --delete_all_trail_marks = "<A-L>",
        --paste_at_last_trail_mark = "<A-p>",
        --paste_at_all_trail_marks = "<A-P>",
        --set_trail_mark_select_mode = "<A-t>",
        --switch_to_next_trail_mark_stack = "<A-.>",
        --switch_to_previous_trail_mark_stack = "<A-,>",
        --set_trail_mark_stack_sort_mode = "<A-s>",
      --},
    --},
  --},
  --quickfix_mappings = { -- rename this to "force_quickfix_mappings" to completely override default mappings and not merge with them
    --nv = {
      --motions = {
        --qf_motion_move_trail_mark_stack_cursor = "<CR>",
      --},
      --actions = {
        --qf_action_delete_trail_mark_selection = "d",
        --qf_action_save_visual_selection_start_line = "v",
      --},
      --alt_actions = {
        --qf_action_save_visual_selection_start_line = "V",
      --},
    --},
    --v = {
      --actions = {
        --qf_action_move_selected_trail_marks_down = "<C-j>",
        --qf_action_move_selected_trail_marks_up = "<C-k>",
      --},
    --},
  --},
--}
--)
