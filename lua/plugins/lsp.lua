return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'rafamadriz/friendly-snippets',
		'saadparwaiz1/cmp_luasnip',
		{ 'L3MON4D3/LuaSnip', 
			build = "make install_jsregexp",
		},
		{
			'windwp/nvim-autopairs',
			event = "InsertEnter",
			config = true
		}
	},
	
	config = function()
		require('mason').setup()
		require('mason-lspconfig').setup()
		
		local capabilities = require'cmp_nvim_lsp'.default_capabilities()
		local cmp_autopairs = require'nvim-autopairs.completion.cmp'
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup {}
		require('luasnip.loaders.from_vscode').lazy_load()
		-- require('luasnip.loaders.from_vscode').lazy_load({ paths = { "./snippets" }})

		cmp.setup{
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				['<Tab>'] = cmp.mapping.select_next_item(),
				['<S-Tab>'] = cmp.mapping.select_prev_item(),
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete{},
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<C-l>'] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { 'i', 's' }),
				['<C-h>'] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { 'i', 's' }),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
			}),

			require'lspconfig'.lua_ls.setup {
				capabilities = capalibilities
			},
			require'lspconfig'.rust_analyzer.setup {
				capabilities = capalibilities
			},
			require'lspconfig'.bashls.setup {
				capabilities = capalibilities
			},
			require'lspconfig'.yamlls.setup {
				capabilities = capalibilities
			}
		}
	end
}
