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
        -- null_ls.builtins.diagnostics.gci,
        -- null_ls.builtins.formatting.golangci-lint,
        --null_ls.builtins.diagnostics.cpplint,
        --  This is the syntax for adding linters 
        require("none-ls.formatting.eslint_d"),  -- requires none-ls-extras.nvim
        -- require("none-ls.diagnostics.gci"),  -- requires none-ls-extras.nvim
        require("none-ls.diagnostics.cpplint"),   -- requires none-ls-extras.nvim
      },
    })
    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
  end,
}
