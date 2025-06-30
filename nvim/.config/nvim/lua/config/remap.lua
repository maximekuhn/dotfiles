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

-- Copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')

-- Paste and yank to the blank register
vim.keymap.set({ "n", "v" }, "<leader>p", [["_dP]])

-- Quickfix list next/previous
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")
