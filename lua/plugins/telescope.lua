return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	dependencies = {
		'nvim-lua/plenary.nvim'
	},
	config = function()
		local builtin = require 'telescope.builtin'
		vim.keymap.set('n', '<leader>sf', builtin.find_files)
		vim.keymap.set('n', '<leader>sg', builtin.live_grep)
		vim.keymap.set('n', '<leader>ch', builtin.command_history)
		vim.keymap.set('n', '<leader>bb', builtin.buffers)
		vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)
	end,
}
