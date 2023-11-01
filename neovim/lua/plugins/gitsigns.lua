return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = function()
		return {
			on_attach = function(buffer)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
				end

				map("n", "]c", gs.next_hunk, "Next Hunk")
				map("n", "[c", gs.prev_hunk, "Prev Hunk")
			end,
		}
	end,
}
