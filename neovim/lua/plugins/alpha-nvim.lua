local M = {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require "alpha"
    local alphaterm = require "alpha.term" -- needed, ignore unused local
    local dashboard = require "alpha.themes.dashboard"

    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("p", "  Projects", ":Telescope project<CR>"),
      dashboard.button("f", "  Find files", ":Telescope find_files<CR>"),
      dashboard.button("c", "  NVIM Config", ":e ~/Documents/personal_repos/nixfiles/neovim/init.lua<CR>"),
      dashboard.button("n", "  NIX Config", ":e ~/Documents/personal_repos/nixfiles/home.nix<CR>"),
      dashboard.button("q", "󰩈  Quit Neovim", ":qa<CR>"),
    }

    local function footer()
      -- Number of plugins
      --local total_plugins = #vim.tbl_keys(vim.g.plugs)
      local datetime = os.date "%d-%m-%Y %H:%M:%S"
      local plugins_text = "   v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
        .. "   "
        .. datetime

      return plugins_text .. "\n"
    end

    dashboard.section.footer.val = footer()

    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.buttons.opts.hl = "Keyword"

    dashboard.opts.opts.noautocmd = true

    local width = 63
    local height = 25
    dashboard.section.terminal.command = "cat | " .. os.getenv "HOME" .. "/.config/nvim/lua/db/lucia_2.sh"
    dashboard.section.terminal.width = width
    dashboard.section.terminal.height = height
    dashboard.section.terminal.opts.redraw = true

    dashboard.config.layout = {
      { type = "padding", val = 1 },
      dashboard.section.terminal,
      { type = "padding", val = 5 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    alpha.setup(dashboard.opts)
  end,
}

return M
