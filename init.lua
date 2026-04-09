vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.swapfile = false
vim.o.undofile = true
vim.o.undolevels = 10000
vim.o.undodir = vim.fn.expand("~/.vim/undodir")
vim.o.errorbells = false
vim.o.wildmenu = true
vim.o.wildmode = "longest:full,full"
vim.o.autoindent = true
vim.g.have_nerd_font = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.mouse = "a"
vim.o.showmode = false
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
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.timeoutlen = 300
vim.o.updatetime = 250
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 4
-- vim.o.completeopt = { "menuone", "popup", "noinsert" }
vim.o.winborder = "rounded"

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines
	jump = { float = true },
})
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saghen/blink.cmp", 
            version = "1.*" }
})

require("mason").setup()

require("nvim-autopairs").setup()

require("nvim-treesitter").setup()

require("fzf-lua").setup({})

local fz = require('fzf-lua')
vim.keymap.set('n', '<leader>sf', fz.files, {desc = "[S]earch [F]iles"})
vim.keymap.set('n', '<leader>b', fz.buffers {desc = "Search [B]uffers"}))
vim.keymap.set('n', '<leader>sg', fz.live_grep {desc = "[S]earch [G]rep in Files"}))

require("blink.cmp").setup({
    fuzzy = {
        prebuilt_binaries = {
            force_version = 'v*'
        },
        implementation = 'prefer_rust_with_warning',
    },
    --fuzzy = { implementation = 'prefer_rust'},

    keymap = {
        preset = 'default'
    },

    signature = { enabled = true},

    appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "normal",
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
        }
    },

    cmdline = {
        keymap = {
            preset = 'inherit',
            ['<CR>'] = { 'accept_and_enter' , 'fallback' },
        },
    },

    sources = {
        default = {
            'lsp',
            'path',
            'snippets',
            'buffer'
        }
    }

})

require("rose-pine").setup({
    styles = {
        bold = false,
        italic = true,
        transparency = true,
    },
})

vim.cmd("colorscheme rose-pine")

vim.lsp.config('*', {
    root_markers = { '.git' },
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    }
})
vim.lsp.enable({ 'bashls', 
                 'jdtls' 
              })
