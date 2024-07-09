-- local pattern = "%.md$"
-- TODO: finish making sure that it doesn't show in readme files
--
-- if (string.match(vim.api.nvim_buf_get_name(0), pattern) ~= ".md") then
vim.cmd("set cc=90")
-- else
-- 	print("shut up")
-- 	vim.cmd("set cc=0")
-- end
-- vim.api.nvim_buf_get_name(0)
-- print((string.match(vim.api.nvim_buf_get_name(0), pattern)) ~= ".lua")
-- print(string.match(vim.api.nvim_buf_get_name(0), pattern))
-- print(vim.fn.expand("%"))
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set rtp+=/opt/homebrew/opt/fz")
vim.g.mapleader = " "
-- Disable virtual_text since it's redundant due to lsp_lines.
vim.diagnostic.config({
	virtual_text = false,
})
vim.cmd("autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=500}")
