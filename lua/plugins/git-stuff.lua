return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      -- this it not i
      require("gitsigns").setup()
      vim.keymap.set("n", "<leader>gp", "<cmd>Gitsigns preview<CR>")
      vim.keymap.set("n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>")
    end,
  },
  {
    "tpope/vim-fugitive",
  },
}
