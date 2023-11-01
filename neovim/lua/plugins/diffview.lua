return {
	"sindrets/diffview.nvim",
	keys = {
		{ "<leader>gdd", "<cmd>DiffviewOpen<CR>", desc = "Diff (current)" },
		{
			"<leader>ghd",
			function()
				require("github").check_pr()
			end,
			desc = "Check PR",
		},
		{
			"<leader>gdv",
			function()
				vim.ui.input({ prompt = "LeftBranch...RightBranch: " }, function(branches)
					if branches ~= nil then
						vim.cmd("DiffviewOpen " .. branches)
					end
				end)
			end,
			desc = "DiffviewOpen",
		},
		{ "<leader>gdo", "<CMD>DiffviewOpen origin/head...head<CR>", desc = "Diff origin vs local" },
	},
	config = true,
}
