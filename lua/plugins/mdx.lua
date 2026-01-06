return {
	"davidmh/mdx.nvim",
	-- Remove config = true or any config function
	-- This plugin doesn't need setup
	ft = "mdx",  -- Only load for MDX files
	dependencies = { "nvim-treesitter/nvim-treesitter" },
}
