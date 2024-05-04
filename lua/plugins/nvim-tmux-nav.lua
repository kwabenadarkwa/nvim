return {
	"christoomey/vim-tmux-navigator",
  vim.keymap.set('n','C-h',':TmuxNavigateLeft'),
  vim.keymap.set('n','C-j',':TmuxNavigateDown'),
  vim.keymap.set('n','C-k',':TmuxNavigateUp'),
  vim.keymap.set('n','C-l',':TmuxNavigateRight'),
}
