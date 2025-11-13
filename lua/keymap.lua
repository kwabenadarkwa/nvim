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

-- adding things to the quick fix list
vim.keymap.set("n", "<leader>cn", ":cnext<CR>")
vim.keymap.set("n", "<leader>cp", ":cprev<CR>")

-- yanking and pasting from system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')

--opening floating diagnostic
vim.keymap.set("n", "<leader>fo", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- this is to bring the if err == nil thing that you do in golang
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR><Tab>return err<CR>}<Esc>")
