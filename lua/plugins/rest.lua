return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    },
    keybinds = {
      {
        "<leader>rr", "<cmd>Rest run<cr>", "Run request under the cursor",
      },
      {
        "<leader>rl", "<cmd>Rest run last<cr>", "Re-run latest request",
      },
    }
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    ensure_installed = { "lua", "xml", "http", "json", "graphql" },
    config = function()
      require("rest-nvim").setup()
      -- first load extension
      require("telescope").load_extension("rest")
      -- then use it, you can also use the `:Telescope rest select_env` command
      require("telescope").extensions.rest.select_env()
    end,
  }
}
