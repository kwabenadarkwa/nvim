vim.cmd("set cc=80")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set rtp+=/opt/homebrew/opt/fz")
vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>0return err<Esc>")


vim.diagnostic.config({
	virtual_text = false,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
})

vim.keymap.set("n", "<leader>t", vim.cmd.UndotreeToggle)
vim.cmd("autocmd TextYankPost * silent! lua vim.highlight.on_yank {higrcup='Visual', timeout=500}")

vim.opt.conceallevel = 2

-- astro settings
vim.filetype.add({
	extension = {
		astro = "astro",
	},
})
