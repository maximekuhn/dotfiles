return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>pw', builtin.lsp_workspace_symbols, {})
        vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {})
        vim.keymap.set('n', '<leader>lbd', function()
            builtin.diagnostics({ bufnr = 0 })
        end, {})
    end
}
