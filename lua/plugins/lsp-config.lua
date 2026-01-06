return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				log_level = vim.log.levels.DEBUG,
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	-- This is what is used for the lines that show as issues when you're coding
	{
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup({
				vim.diagnostic.config({
					virtual_text = false,
				}),
				vim.keymap.set("", "<leader>ll", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" }),
			})
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
					"pyright",
					"gopls",
					"omnisharp",
					"astro",
					-- "eslint-lsp",
					-- "tailwindcss-language-server",
					-- "typescript-language-server",
				},
				automatic_installation = true,
			})
		end,
	},
	{ "Hoffs/omnisharp-extended-lsp.nvim" },
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			--             Failed to run `config` for nvim-lspconfig
			--
			-- .../Cellar/neovim/0.11.4/share/nvim/runtime/lua/vim/lsp.lua:388: name: expected non-wildcard string, got nil
			--
			-- # stacktrace:
			--   - vim/shared.lua:0 _in_ **validate**
			--   - /opt/homebrew/Cellar/neovim/0.11.4/share/nvim/runtime/lua/vim/lsp.lua:388 _in_ **validate_config_name**
			--   - /opt/homebrew/Cellar/neovim/0.11.4/share/nvim/runtime/lua/vim/lsp.lua:463 _in_ **config**
			--   - lua/plugins/lsp-config.lua:79 _in_ **config**
			--   - init.lua:2
			-- require("lspconfig")
			local lspconfig = vim.lsp.config
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					lua_ls = { completeUnimported = true },
					Lua = {
						hint = {
							enable = true,
						},
						runtime = {
							-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						-- Do not send telemetry data containing a randomized but unique identifier
						telemetry = {
							enable = false,
						},
					},
				},
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
				settings = {
					clangd = { completeUnimported = true },
				},
			})
			lspconfig.unocss.setup({
				capabilities = capabilities,
				settings = {
					unocss = { completeUnimported = true },
				},
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				settings = {
					tailwindcss = { completeUnimported = true },
				},
			})
			lspconfig.eslint.setup({
				capabilities = capabilities,
				settings = {
					eslint = { completeUnimported = true },
				},
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
				settings = {
					ts_ls = { completeUnimported = true },
				},
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
				settings = {
					pyright = { completeUnimported = true },
				},
			})
			-- TODO: might have to come back here to understanding what's going on if something goes wrong
			lspconfig.gopls.setup({
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
						linksInHover = false,
						codelenses = {
							generate = true,
							gc_details = true,
							regenerate_cgo = true,
							tidy = true,
							upgrade_depdendency = true,
							vendor = true,
						},
						usePlaceholders = true,
					},
				},
			})
			lspconfig.omnisharp.setup({
				capabilities = capabilities,
				cmd = {
					"dotnet",
					"/Users/kwabenadarkwa/.local/share/nvim/mason/packages/omnisharp/OmniSharp.dll",
				},
				handlers = {
					["textDocument/definition"] = require("omnisharp_extended").definition_handler,
					["textDocument/typeDefinition"] = require("omnisharp_extended").type_definition_handler,
					["textDocument/references"] = require("omnisharp_extended").references_handler,
					["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
				},
				settings = {
					omnisharp = { completeUnimported = true },
					FormattingOptions = {
						EnableEditorConfigSupport = true,
						OrganizeImports = true,
					},
					MsBuild = {
						LoadProjectsOnDemand = true,
					},
					RoslynExtensionsOptions = {
						EnableAnalyzersSupport = true,
						EnableImportCompletion = true,
						AnalyzeOpenDocumentsOnly = nil,
						EnableDecompilationSupport = true,
					},
					Sdk = {
						IncludePrereleases = true,
					},
				},
			})
			lspconfig.astro.setup({
				capabilities = capabilities,
				settings = {
					astro = { completeUnimported = true },
				},
			})

			-- this is because I want to use noice
			-- vim.keymap.set("n", "K", require("noice.lsp").hover(), {})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {})
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", {})
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", {})

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end,
	},
}
