return {
	"LunarVim/bigfile.nvim",
	event = "BufReadPre",
	opts = {
		file_size = 2,
	},
	config = function(_, opts)
		require("bigfile").setup(opts)
	end,
}
