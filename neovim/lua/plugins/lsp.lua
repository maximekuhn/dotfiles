return {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", },

    config = function()
        -- Completion
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local cmp = require('cmp')
        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
            },

            -- Key mapping
            mapping = cmp.mapping.preset.insert({
                ['<CR>'] = cmp.mapping.confirm({ select = false }),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
            }),

            -- LuaSnip
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })

        -- LSP
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
        lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
        }

        -- Lua ls
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
        }
    end
}
