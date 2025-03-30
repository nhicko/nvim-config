return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason-lspconfig.nvim',
	},
	config = function()
		require'mason-lspconfig'.setup {
		ensure_installed = { "lua_ls" }
		}
		require'lspconfig'.lua_ls.setup{}
	end,
}
