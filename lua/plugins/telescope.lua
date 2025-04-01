return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    tag = "0.1.8",

    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      -- you should have ripgrep installed before this works
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      local actions = require("telescope.actions")
      -- This is your opts table
      require("telescope").setup({
        defaults = {
          -- layout_strategy = "vertical",
          -- layout_config = {
          -- 	width = 0.8,
          -- },
          mappings = {
            n = {
              ["q"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            -- theme = "ivy",
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
          },
        },
      })
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("noice")
    end,
  },
}
