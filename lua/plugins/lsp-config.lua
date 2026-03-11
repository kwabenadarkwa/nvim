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

			-- Using native vim.lsp.config API (Neovim 0.11+)
			vim.lsp.config.lua_ls = {
				capabilities = capabilities,
				settings = {
					Lua = {
						hint = {
							enable = true,
						},
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			}

			vim.lsp.config.clangd = {
				capabilities = capabilities,
			}

			vim.lsp.config.unocss = {
				capabilities = capabilities,
			}

			vim.lsp.config.tailwindcss = {
				capabilities = capabilities,
			}

			vim.lsp.config.eslint = {
				capabilities = capabilities,
			}

			vim.lsp.config.ts_ls = {
				capabilities = capabilities,
			}

			vim.lsp.config.pyright = {
				capabilities = capabilities,
			}

			vim.lsp.config.gopls = {
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
			}

			vim.lsp.config.omnisharp = {
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
			}

			vim.lsp.config.astro = {
				capabilities = capabilities,
			}

			-- Enable all configured LSP servers
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("clangd")
			vim.lsp.enable("unocss")
			vim.lsp.enable("tailwindcss")
			vim.lsp.enable("eslint")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("gopls")
			vim.lsp.enable("omnisharp")
			vim.lsp.enable("astro")

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", {})
			vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", {})

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end,
	},
}
