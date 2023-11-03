require("toggleterm").setup{}

vim.keymap.set("n", "<leader>tm", "<cmd>ToggleTermToggleAll<CR>")
vim.keymap.set("t", "<leader>tm", "<cmd>ToggleTermToggleAll<CR>")
vim.keymap.set("t", "<leader>tp", "<C-\\><C-n>pi")
vim.keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm direction=horizontal name=Terminal2<CR>")
vim.keymap.set("t", "<leader>t2", "<cmd>2ToggleTerm<CR>")
vim.keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm direction=float name=Terminal2<CR>")
vim.keymap.set("t", "<leader>t1", "<cmd>1ToggleTerm<CR>")
