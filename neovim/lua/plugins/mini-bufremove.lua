local M = {
  "echasnovski/mini.bufremove",
  -- stylua: ignore
  keys = {
    { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
  },
}

return M
