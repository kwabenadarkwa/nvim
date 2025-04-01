return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  event = "InsertEnter",
  config = function()
    require("luasnip.loaders.from_lua").lazy_load({ paths = "./lua/luasnip/" })
    local ls = require("luasnip")
    ls.setup({
      update_events = { "TextChanged", "TextChangedI" },
      enable_autosnippets = true,
      store_selection_keys = "<Tab>",
    })
  end,
}
