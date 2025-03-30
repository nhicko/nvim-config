return {
	'hrsh7th/nvim-cmp',
	dependencies = {
		'L3MON4D3/LuaSnip', tag = 'v2.3.0', build = "make install_jsregexp",
		'saadparwaiz1/cmp_luasnip',
		'rafamadriz/friendly-snippets',
		'hrsh7th/cmp-nvim-lsp',
	},
	config = function()
		local cmp = require'cmp'
		cmp.setup({
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }),
			}),
			sources = cmp.config.sources({
				{ name = 'luasnip' }
			})
		})
		require("luasnip.loaders.from_vscode").lazy_load()
		local ls = require("luasnip")
		vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
		vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
		vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

		vim.keymap.set({"i", "s"}, "<C-E>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end, {silent = true})
	end
}
