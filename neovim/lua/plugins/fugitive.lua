-- A Git wrapper so awesome, it should be illegal
return {
	"tpope/vim-fugitive",
	event = "VeryLazy",
	keys = {
		{ "<leader>gg", "<cmd>G<cr>", desc = "Git Fugitive" },
		{ "<leader>gp", "<cmd>G push<cr>", desc = "Git Push" },
		{ "<leader>gb", "<cmd>G blame<cr>", desc = "Git Blame" },
		{ "<leader>gl", ":GcLog<cr>", desc = "Git Log", mode = { "n", "v" } },
	},
}
