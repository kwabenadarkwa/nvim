return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Trouble",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		require("trouble").setup({})
	end,
	keys = {
		{
			"<leader>tt",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>bt",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		-- {
		-- 	"<leader>cs",
		-- 	"<cmd>Trouble symbols toggle focus=false<cr>",
		-- 	desc = "Symbols (Trouble)",
		-- },
		-- {
		-- 	"<leader>cl",
		-- 	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
		-- 	desc = "LSP Definitions / references / ... (Trouble)",
		-- },
		-- {
		-- 	"<leader>xL",
		-- 	"<cmd>Trouble loclist toggle<cr>",
		-- 	desc = "Location List (Trouble)",
		-- },
		{
			"<leader>qf",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
