return {
	'neovim/nvim-lspconfig',
	{'williamboman/mason-lspconfig.nvim', opts = {} },
	dependencies = {
		{ 'williamboman/mason.nvim', opts = {} },
		'hrsh7th/cmp-nvim-lsp',
		{ 'hrsh7th/nvim-cmp', event = 'InsertEnter' },
		'hrsh7th/cmp-nvim-lsp-signature-help',
		{ 'L3MON4D3/LuaSnip', 
			build = "make install_jsregexp",
			dependencies = {
				'rafamadriz/friendly-snippets',
			}
		},
		'saadparwaiz1/cmp_luasnip',
	},
	
	config = function()
		local capabilities = require'cmp_nvim_lsp'.default_capabilities()
		require'lspconfig'.lua_ls.setup {
			capabilities = capalibilities
		}
		require'lspconfig'.rust_analyzer.setup {
			capabilities = capalibilities
		}
		require'lspconfig'.bashls.setup {
			capabilities = capalibilities
		}
		require'lspconfig'.yamlls.setup {
			capabilities = capalibilities
		}
		
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup {}
		require('luasnip.loaders.from_vscode').lazy_load()

		cmp.setup{
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
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
			completion = { completeopt = 'menu,menuone,noinsert' },
			
			sources = {
				{name = 'nvim_lsp' },
				{ name = 'luansip' },
				{ name = 'nvim_lsp_signature_help' },
			},
		}
	end
}
