return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  keys = {
    { ",v", "<cmd>VenvSelect fd 'python$' . --full-path -IH -a<cr>" },
  },
  ---@type venv-selector.Config
  opts = {
    -- Your settings go here
    search = {
      my_venvs = {
        command = "fd bin/python$ ~/Documents --full-path",
      },
    },
  },
}
