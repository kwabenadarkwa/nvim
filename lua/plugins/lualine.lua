return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({
      options = {
        theme = "nightfly",
        icons_enabled = true,
        compnent_separators = "|",
        section_separators = " ",
        diff = true,
      },
      sections = {
        lualine_x = {
          {
            "rest",
            icon = "",
            fg = "#428890",
          },
        },
      },
    })
  end,
}
