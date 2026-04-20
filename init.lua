vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.swapfile = false
vim.o.errorbells = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 8
vim.o.shiftwidth = 8
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.mouse = "a"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true

vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})
-- for WSL1, disable if not using WSL1
lua vim.api.nvim_create_autocmd("TextYankPost",{callback=function() vim.fn.system("clip.exe",vim.fn.getreg('"')) end})

vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', '<S-n>', '<S-n>zz')

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim" },
	{ src = "https://github.com/saghen/frizbee" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/mfussenegger/nvim-jdtls" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/tpope/vim-fugitive" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/saghen/blink.cmp",
                version = '1.10.1',
                build = 'cargo build --release' },
	{ src = "https://github.com/windwp/nvim-autopairs" }
})

local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
require('telescope').setup({
        defaults = {
                mappings = {
                        i = {
                                ["<C-q>"] = function(prompt_bufnr)
                                        actions.send_to_qflist(prompt_bufnr)
                                        vim.schedule(require("telescope.builtin").quickfix)
                                end
                        },
                        n = {
                                ["<C-q>"] = function(prompt_bufnr)
                                        actions.send_to_qflist(prompt_bufnr)
                                        vim.schedule(require("telescope.builtin").quickfix)
                                end
                        },
                },
        },
})
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>q', builtin.quickfix, { desc = 'Telescope quickfix' })

require('mason').setup()
require('cmp').setup()
require('nvim-treesitter').setup()
require('nvim-autopairs').setup()
require('blink.cmp').setup({
        fuzzy = { implementation = 'prefer_rust_with_warning' },
        sources = { 
                default = { 'lsp' , 'snippets' , 'path' },
        }, 
        snippets = { preset = "default" },
        signature = { enabled = true,
                        window = { show_documentation = false } },
--        completion.keyword = { range = 'prefix' }
})

vim.lsp.enable ({ 'jdtls',
                  'lua_ls',
                  'bash-language-server',
                  'markdown',
                  'rust-analyzer'
                })
