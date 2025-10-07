-- local pattern = "%.md$"
-- TODO: finish making sure that it doesn't show in readme files
--
-- if (string.match(vim.api.nvim_buf_get_name(0), pattern) ~= ".md") then
vim.cmd("set cc=80")
-- else
-- 	print("shut up")
-- 	vim.cmd("set cc=0")
-- end
-- vim.api.nvim_buf_get_name(0)
-- print((string.match(vim.api.nvim_buf_get_name(0), pattern)) ~= ".lua")
-- print(string.match(vim.api.nvim_buf_get_name(0), pattern))
-- print(vim.fn.expand("%"))
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
-- vim.cmd("set virtualedit=all")
vim.cmd("set rtp+=/opt/homebrew/opt/fz")
vim.g.mapleader = " "
-- vim.diagnostic.config({
--   virtual_text = false,
-- })

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
-- Show line diagnostics automatically in hover window
-- Add a command to toggle diagnostic virtual text
-- local diagnosticVirtualTextEnable = false
-- vim.api.nvim_create_user_command(
-- "ToggleDiagnosticVirtualText",
-- function(args)
--   if diagnosticVirtualTextEnable then
--     vim.diagnostic.config({
--        virtual_text = false
--     })
--
--     else
--     -- Diagnostic messages displayed at the end of the line
--     vim.diagnostic.config({
--       virtual_text = {
--         prefix = '●', -- Prefix symbol
--         suffix = '',
--         format = function(diagnostic)
--           -- print(vim.inspect(diagnostic))
--           return string.format([[
-- code: %s
-- source: %s
-- message: %s
-- ]],
--             diagnostic.code,
--             diagnostic.source,
--             diagnostic.message
--           )
--         end,
--       }
--     })
--   end
--   diagnosticVirtualTextEnable = not diagnosticVirtualTextEnable
--   if #args.fargs == 0 then
--     vim.notify("diagnosticVirtualTextEnable: " .. tostring(diagnosticVirtualTextEnable), vim.log.levels.INFO)
--   end
-- end,
-- {
--   nargs = "?",
--   desc = "Toggle diagnostic virtual text display"
-- }
-- )
--  -- opens the diagnostic dialog box after focusing on it for 250 mil seconds
--  vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
--  {
--    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
--    config = function()
--      require("lsp_lines").setup({
--        vim.diagnostic.config({
--          virtual_text = true,
--        }),
--        vim.keymap.set("", "<leader>ll", require("lsp_lines").toggle, { desc = "toggle lsp_lines" }),
--      })
--    end,
--  }

vim.keymap.set("n", "<leader>t", vim.cmd.UndotreeToggle)
vim.cmd("autocmd TextYankPost * silent! lua vim.highlight.on_yank {higrcup='Visual', timeout=500}")

vim.opt.conceallevel = 2

-- astro settings
vim.filetype.add({ extension = {
	astro = "astro",
} })
