return {
	'williamboman/mason-lspconfig.nvim',
	'neovim/nvim-lspconfig',
	config = function()
		require'mason-lspconfig'.setup {
			ensure_installed = { 'lua_ls' },
		}
		require'lspconfig'.lua_ls.setup {}
	end
}
