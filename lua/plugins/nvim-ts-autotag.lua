return {
	"windwp/nvim-ts-autotag",
	event = "VeryLazy",
	ft = {
		"html",
		"xml",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"css",
		"scss",
		"vue",
		"svelte",
		"astro",
		"markdown",
		"mdx",
		"json",
		"yaml",
		"toml",
	},

	config = function()
		require("nvim-ts-autotag").setup()
	end,
}
