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
        },
        automatic_installation = true,
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
        settings = {
          lua_ls = { completeUnimported = true },
          Lua = {
            -- make the language server recognize "vim" global
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })
      lspconfig.clangd.setup({
        capabilites = capabilities,
        settings = {
          clangd = { completeUnimported = true },
        },
      })
      lspconfig.unocss.setup({
        capabilites = capabilities,
        settings = {
          unocss = { completeUnimported = true },
        },
      })
      lspconfig.tsserver.setup({
        capabilites = capabilities,
        settings = {
          tsserver = { completeUnimported = true },
        },
      })
      lspconfig.pyright.setup({
        capabilites = capabilities,
        settings = {
          pyright = { completeUnimported = true },
        },
      })
      lspconfig.gopls.setup({
        capabilites = capabilities,
        settings = {
          gopls = { completeUnimported = true },
        },
      })
      lspconfig.omnisharp.setup({
        cmd = {
          -- "/opt/homebrew/bin/mono",
          "dotnet",
          -- "/Users/kwabenadarkwa/.local/share/nvim/mason/packages/omnisharp/omnisharp",
          "/Users/kwabenadarkwa/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll",
          -- "/opt/homebrew/bin/omnisharp",
        },
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = true,
          },
          MsBuild = {
            LoadProjectsOnDemand = nil,
          },
          RoslynExtensionsOptions = {
            EnableAnalyzersSupport = true,
            EnableImportCompletion = true,
            AnalyzeOpenDocumentsOnly = nil,
          },
          Sdk = {
            IncludePrereleases = true,
          },
        },
      })lspconfig.astro.setup({
        capabilites = capabilities,
        settings = {
          astro = { completeUnimported = true },
        },
      })


      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", {})
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
