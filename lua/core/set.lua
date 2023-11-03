local api = vim.api
local vi = vim.opt
vi.guicursor = ""

vi.clipboard="unnamedplus"

vi.nu = true
vi.relativenumber = true

vi.tabstop = 4
vi.softtabstop = 4
vi.shiftwidth = 4
vi.expandtab = true

vi.smartindent = true

vi.wrap = false

vi.swapfile = false
vi.backup = false
vi.undodir = os.getenv("HOME") .. "/.vim/undodir"
vi.undofile = true

vi.hlsearch = false
vi.incsearch = true
vi.ignorecase = true

vi.termguicolors = true

vi.scrolloff = 8
vi.signcolumn = "yes"
vi.isfname:append("@-@")

vi.updatetime = 50

local termGrp = api.nvim_create_augroup("TermOpen", { clear = true})
api.nvim_create_autocmd("TermOpen", {
    command  = "setlocal nonumber norelativenumber",
    group = termGrp,
})
-- vim.opt.colorcolumn = "80"

vim.g.mapleader = " "
