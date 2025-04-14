return {
	'akinsho/toggleterm.nvim',
	version = "*",
	opts = {
		vim.keymap.set('n', '<leader><c-1>','<cmd>ToggleTerm direction=float<CR>'),
		vim.keymap.set('t', '<leader><c-1>','<cmd>ToggleTermToggleAll<CR>')
	}
}
