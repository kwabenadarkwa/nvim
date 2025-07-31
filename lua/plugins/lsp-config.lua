local function get_python_path(workspace)
  -- Check if VIRTUAL_ENV is set
  local venv = vim.fn.getenv("VIRTUAL_ENV")
  if venv ~= vim.NIL and vim.fn.executable(venv .. "/bin/python") == 1 then
    return venv .. "/bin/python"
  end

  -- Common venv directory names
  local venv_names = { ".venv", "venv", ".virtualenv", "env" }
  -- Use LSP utilities to get the workspace root
  local root = workspace or vim.lsp.buf.list_workspace_folders()[1] or vim.fn.getcwd()

  -- Look for venv in the project root
  for _, name in ipairs(venv_names) do
    local path = root .. "/" .. name .. "/bin/python"
    if vim.fn.executable(path) == 1 then
      return path
    end
  end

  -- Fallback to system Python
  return vim.fn.exepath("python3") or "python3"
end
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
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        capabilites = capabilities,
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
      lspconfig.tailwindcss.setup({
        capabilites = capabilities,
        settings = {
          tailwindcss = { completeUnimported = true },
        },
      })
      lspconfig.eslint.setup({
        capabilites = capabilities,
        settings = {
          eslint = { completeUnimported = true },
        },
      })
      lspconfig.ts_ls.setup({
        capabilites = capabilities,
        settings = {
          ts_ls = { completeUnimported = true },
        },
      })
      lspconfig.pyright.setup({
        capabilites = capabilities,
        settings = {
          pyright = { completeUnimported = true },
        },
      })
      -- TODO: might have to come back here to understanding what's going on if something goes wrong
      lspconfig.gopls.setup({
        capabilites = capabilities,
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
        capabilites = capabilities,
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
