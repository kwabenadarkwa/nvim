return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufNewFile", "BufReadPost" },
  ensure_installed = {
    "lua",
    "xml",
    "html",
    "http",
    "json",
    "graphql",
    "sql",
    "python",
    "go",
    "typescript",
    "javascript",
    "bash",
    "markdown_inline",
    "regex",
    "tsx",
    "css",
    "xaml",
    "axaml"
  },
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "latex" },
        additional_vim_regex_highlighting = { "astro" },
      },
      indent = { enable = true },
    })
  end,
}
