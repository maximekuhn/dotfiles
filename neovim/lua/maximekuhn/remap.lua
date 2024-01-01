vim.g.mapleader = " "

-- vim :Ex command returns to netrw (directory listing), pv = project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move half page + center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
