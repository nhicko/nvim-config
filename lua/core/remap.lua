vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ly", "<cmd>autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe',@0) | endif<CR>")
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>w", vim.cmd.w)
vim.keymap.set("n", "<leader>e", vim.cmd.enew)
vim.keymap.set("n", "<leader>t", vim.cmd.tabe)
vim.keymap.set("n", "<leader>q", "<cmd>q!<CR>")
vim.keymap.set("n", "<leader>d", "<cmd>bd!<CR>")
vim.keymap.set("n", "<leader>cj", "<cmd>cnfile<CR>zz")
vim.keymap.set("n", "<leader>ck", "<cmd>cpfile<CR>zz")
vim.keymap.set("n", "<leader>cn", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>cp", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "L", vim.cmd.tabnext)
vim.keymap.set("n", "H", vim.cmd.tabprev)

vim.keymap.set("n", "cn", "<cmd>cnfile<CR>")
vim.keymap.set("n", "cp", "<cmd>cpfile<CR>")
vim.keymap.set("n", "[q", "<cmd>cnext<CR>")
vim.keymap.set("n", "]q", "<cmd>cprev<CR>")

vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

vim.keymap.set("n", "gw", "<cmd>set wrap!<CR>")

vim.keymap.set("n", "ss", "<cmd>split<CR><C-w>w")
vim.keymap.set("n", "sv", "<cmd>vsplit<CR><C-w>w")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "Y", "yg$")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)
