return {
  {
    "hrsh7th/cmp-nvim-lsp",
    dependencies = {
      "hrsh7th/cmp-path",
    },
  },
  {
    "micangl/cmp-vimtex",
    ft = "tex",
    config = function()
      require("cmp_vimtex").setup({})
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",    --autocomplete on the buffer
      "hrsh7th/cmp-path",      --autocomplete path variables
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip", --autocomplete from luasnip
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup.filetype({ "sql" }, {
        sources = {
          { name = "vim-dadbod-completion" }, { name = "buffer" },
        },
      })
      cmp.setup.filetype("tex", {
        sources = {
          { name = "vimtex" },
          { name = "luasnip" },
          { name = "buffer" },
        },
      })

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.scroll_docs(-4),
          ["<C-j>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
