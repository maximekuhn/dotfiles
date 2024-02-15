return {
    "neovim/nvim-lspconfig",

    config = function()
        local lspconfig = require("lspconfig")

        -- Global mappings
        -- (g)o to (n)ext (d)iagnostic
        vim.keymap.set('n', '<leader>gnd', vim.diagnostic.goto_prev)
        -- (g)o to (p)rev (d)iagnostic
        vim.keymap.set('n', '<leader>gpd', vim.diagnostic.goto_next)

        -- Keymaps active only when a server is attached
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP Actions',
            callback = function(event)
                local opts = { buffer = event.buf }

                -- (g)o to (d)efinition
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

                -- (g)o to (i)mplementation
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)

                -- (g)o to (r)eferences
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

                -- (c)ode (m)anipulation
                vim.keymap.set({ 'n', 'v' }, '<leader>cm', vim.lsp.buf.code_action, opts)

                -- show type and associated doc
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)

                -- (m)ake (c)ode (p)retty
                vim.keymap.set('n', '<leader>mcp', function()
                    vim.lsp.buf.format { async = true }
                end, opts)

                -- (r)e(n)ame
                -- TODO: find a way to write all affected buffers
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            end
        })

        -- Rust analyzer
        lspconfig.rust_analyzer.setup {}

        -- Lua ls
        lspconfig.lua_ls.setup {}
    end
}
