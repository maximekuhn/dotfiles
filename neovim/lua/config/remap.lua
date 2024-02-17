-- Leader
vim.g.mapleader = " "

-- Project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move half page + center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Navigate between windows
vim.keymap.set("n", "<C-l>", "<C-W>l")
vim.keymap.set("n", "<C-h>", "<C-W>h")

-- Copy to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", '"+y')
