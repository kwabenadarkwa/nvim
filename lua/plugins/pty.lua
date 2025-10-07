return {
	--Options for highlight groups
	--Normal
	-- Comment
	-- Constant
	-- String
	-- Identifier
	-- Function
	-- Statement
	-- Keyword
	-- Type
	-- Operator
	-- Error
	-- Todo
	-- Underlined
	"folke/paint.nvim",
	config = function()
		require("paint").setup({
			highlights = {
				{
					filter = { filetype = "pty" },
					pattern = "->",
					hl = "Operator",
				},
				{
					filter = { filetype = "pty" },
					pattern = "|",
					hl = "Operator",
				},
				{
					filter = { filetype = "pty" },
					pattern = "*",
					hl = "Operator",
				},
				{
					filter = { filetype = "pty" },
					pattern = "%d+",
					hl = "Number",
				},
				{
					filter = { filetype = "pty" },
					pattern = "^#.*",
					hl = "Comment",
				},

				{
					filter = { filetype = "pty" },
					pattern = "%a+",
					hl = "Function",
				},
			},
		})
	end,
}
