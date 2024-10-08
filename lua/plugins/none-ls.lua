return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.golines,
				null_ls.builtins.formatting.csharpier,
				-- null_ls.builtins.formatting.beautysh,
				--  This is the syntax for adding linters
				require("none-ls.formatting.eslint_d"), -- requires none-ls-extras.nvim
				require("none-ls.formatting.beautysh"), -- requires none-ls-extras.nvim
				require("none-ls.diagnostics.cpplint"), -- requires none-ls-extras.nvim
			},
		})
		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
	end,
}
