local disabled_plugins = {
	"folke/flash.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"nvim-neo-tree/neo-tree.nvim",
	"nvim-pack/nvim-spectre",
	"akinsho/bufferline.nvim",
	"nvim-treesitter/nvim-treesitter-context",
	"windwp/nvim-ts-autotag",
	"linux-cultist/venv-selector.nvim",
}

local lazy_disabled = {}
for _, plugin in ipairs(disabled_plugins) do
	lazy_disabled[#lazy_disabled + 1] = { plugin, enabled = false }
end

return lazy_disabled
