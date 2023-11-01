return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		---@diagnostic disable-next-line: unused-local
		local _alphaterm = require("alpha.term") -- needed, ignore unused local
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.buttons.val = {
			dashboard.button("f", " " .. " Find file", "<cmd> Telescope find_files <cr>"),
			dashboard.button("n", " " .. " New file", "<cmd> ene <BAR> startinsert <cr>"),
			dashboard.button(
				"c",
				" " .. " Config",
				"<cmd> lua require('lazyvim.util').telescope.config_files()() <cr>"
			),
			dashboard.button("s", " " .. " Restore Session", [[<cmd> lua require("persistence").load() <cr>]]),
			dashboard.button("l", "󰒲 " .. " Lazy", "<cmd> Lazy <cr>"),
			dashboard.button("q", " " .. " Quit", "<cmd> qa <cr>"),
		}
		for _, button in ipairs(dashboard.section.buttons.val) do
			button.opts.hl = "AlphaButtons"
			button.opts.hl_shortcut = "AlphaShortcut"
		end

		dashboard.opts.opts.noautocmd = true

		local width = 63
		local height = 25
		dashboard.section.terminal.command = "cat | "
			.. os.getenv("HOME") .. "/.config/nvim/lucia.sh"
		dashboard.section.terminal.width = width
		dashboard.section.terminal.height = height
		dashboard.section.terminal.opts.redraw = true

		dashboard.config.layout = {
			{ type = "padding", val = 1 },
			dashboard.section.terminal,
			{ type = "padding", val = 1 },
			dashboard.section.buttons,
		}

		alpha.setup(dashboard.opts)
	end,
}
