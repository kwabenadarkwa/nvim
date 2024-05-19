return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  ensure_installed = {
    "lua",
    "xml",
    "http",
    "json",
    "graphql",
    "sql",
    "python",
    "go",
    "typescript",
    "bash",
    "markdown_inline",
    "regex",
  },
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
