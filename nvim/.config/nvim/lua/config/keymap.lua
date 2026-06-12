vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", "<Cmd>Explore<CR>", { desc = "Open project view" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" } )
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" } )
vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({"n", "v"}, "<leader>p", '"+p', { desc = "Paste from clipboard" })
vim.keymap.set("n", "<leader>pd", function() vim.diagnostic.jump({ count = -1 }) end, { desc = "Go to previous diagnostic" })
vim.keymap.set("n", "<leader>nd", function() vim.diagnostic.jump({ count = 1 }) end, { desc = "Go to next diagnostic" })
vim.keymap.set("n", "<leader>od", vim.diagnostic.open_float, { desc = "Open diagnostic" })
vim.keymap.set("n", "<C-k>", "<Cmd>cprev<CR>", { desc = "Previous quickfix list entry" })
vim.keymap.set("n", "<C-j>", "<Cmd>cnext<CR>", { desc = "Next quickfix list entry" })

