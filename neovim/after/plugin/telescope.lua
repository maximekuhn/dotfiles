local builtin = require('telescope.builtin')

-- All files in the project search, pf = project files
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})

-- All git files in the project search
vim.keymap.set('n', '<C-p>', builtin.git_files, {})

-- Search files in project, ps = project search
vim.keymap.set('n', '<leader>ps', function()
	-- grep requires to have ripgrep installed, otherwise it won't work
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
