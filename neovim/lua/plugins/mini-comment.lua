return {
	"echasnovski/mini.comment",
	opts = function(_, opts)
		return {
			mappings = {
				-- Normal and Visual modes
				comment = ",c",
				comment_visual = ",c",
				-- Toggle comment on current line
				comment_line = ",c",
				-- Define 'comment' textobject (like `dgc` - delete whole comment block)
				textobject = "gc",
			},
		}
	end,
}
