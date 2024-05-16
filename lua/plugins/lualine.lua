return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "dracula",
        icons_enabled = true,
        compnent_separators = "|",
        section_separators = " ",
      },
   })
  end,
}
