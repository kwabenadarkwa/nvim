return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"unocss",
					"tsserver",
					"pylyzer",
          "gopls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilites = capabilities,
			})
			lspconfig.clangd.setup({ capabilites = capabilities })
			lspconfig.unocss.setup({ capabilites = capabilities })
			lspconfig.tsserver.setup({ capabilites = capabilities })
			lspconfig.pylyzer.setup({ capabilites = capabilities })
			lspconfig.gopls.setup({ capabilites = capabilities })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, {})
		end,
	},
}
