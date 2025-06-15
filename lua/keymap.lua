-- if you get a problem here you should probably update your version of nvim.
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("v", "ii", "<Esc>")
vim.keymap.set("n", ";", ":")

--Neo Tree navigation helpers for navigating between different neovim panes
vim.keymap.set("n", "<C-h>", "<C-w>h<CR>")
vim.keymap.set("n", "<C-l>", "<C-w>l<CR>")
vim.keymap.set("n", "<C-j>", "<C-w>j<CR>")
vim.keymap.set("n", "<C-k>", "<C-w>k<CR>")
-- Keymap for Noice(showing past messages)
vim.keymap.set("n", "<leader>nl", function()
	require("noice").cmd("last")
end)
vim.keymap.set("n", "<leader>ns", "<cmd>Telescope noice<CR>")
--Keymap for using inc to rename j
vim.keymap.set("n", "<leader>rn", function()
	return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

vim.keymap.set("n", "<leader>fo", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
