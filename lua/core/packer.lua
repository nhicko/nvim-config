vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')
	use('tpope/vim-fugitive')
	use('tpope/vim-surround')
    use('jremmen/vim-ripgrep')
	use('ThePrimeagen/harpoon')
	use('mbbill/undotree')
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
--    use('rebelot/kanagawa.nvim')
    use('rose-pine/neovim')
    use {'kevinhwang91/nvim-bqf'}
    use('rebelot/kanagawa.nvim')
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end}
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-buffer'},
			{'saadparwaiz1/cmp_luasnip'},
			-- Snippet
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

--    use({
--        "L3MON4D3/LuaSnip",
--        -- follow latest release.
--        tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
--        -- install jsregexp (optional!:).
--        run = "make install_jsregexp"
--    })

--    use { 'alexghergh/nvim-tmux-navigation', config = function()
--
--        local nvim_tmux_nav = require('nvim-tmux-navigation')
--
--        nvim_tmux_nav.setup {
--            disable_when_zoomed = true -- defaults to false
--        }
--
--        vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
--        vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
--        vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
--        vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
--        vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
--        vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
--
--    end
--    }
end)
