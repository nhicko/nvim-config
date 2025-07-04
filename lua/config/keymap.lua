vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<M-j>", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "<M-k>", ":cprev<CR>", { silent = true })
vim.keymap.set("n", "<M-h>", ":tabp<CR>", { silent = true })
vim.keymap.set("n", "<M-l>", ":tabn<CR>", { silent = true })
vim.keymap.set('n','<leader><leader>cd', function() vim.cmd('cd ' .. vim.fn.expand '%:p:h') end)
vim.keymap.set("n", "<leader>w", ":set wrap!<CR>", { silent = true })
vim.keymap.set("n", "<leader>*", function()
	local commit_msg = vim.fn.input("Enter commit message: ")
	vim.cmd("cd ~/work; git add %;git commit -m " .. commit_msg .. " ; git push work master")
end)

vim.keymap.set('v','<leader>w','<cmd>:s/,/,\\r/g<cr><esc>%i<cr><esc>')
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
