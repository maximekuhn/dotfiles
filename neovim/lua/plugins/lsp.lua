-- Find the completion context for a given entry
-- The completion context is the entry path (ex: std::fs::File)
-- If no completion context is present, then nil is returned
-- This method is very experimental but works fine for rust_analyzer
-- TODO: support other LSP
---@param completion lsp.CompletionItem
---@param source cmp.Source
local function get_lsp_completion_context(completion, source)
    local ok, source_name = pcall(function() return source.source.client.config.name end)
    if not ok then
        return nil
    end

    if source_name == "rust_analyzer" then
        -- To analyze payload, set lsp log level to 'debug':
        -- vim.lsp.set_log_level("debug")
        if completion.labelDetails ~= nil then
            return completion.labelDetails.detail
        end
    end

    if source_name == "tsserver" then
        if completion.detail ~= nil then
            return completion.detail
        end
    end

    if source_name == "gopls" then
        if completion.detail ~= nil then
            return completion.detail
        end
    end

    return nil
end

-- Truncates a completion menu field ('abbr' or 'menu' so the menu isn't too big
---@param value string
---@param is_abbr boolean
local function truncate_completion_menu_field(value, is_abbr)
    local window_width = vim.api.nvim_win_get_width(0)
    local ELLIPSIS_CHAR = "..."
    local MAX_CHAR_MENU = window_width * 3 / 10
    local MAX_CHAR_ABBR = window_width * 2 / 10

    local len_to_compare = MAX_CHAR_MENU
    if is_abbr then
        len_to_compare = MAX_CHAR_ABBR
    end

    if string.len(value) > len_to_compare then
        return string.sub(value, 1, len_to_compare - string.len(ELLIPSIS_CHAR)) .. ELLIPSIS_CHAR
    end

    return value
end

return {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "hrsh7th/cmp-path", },

    config = function()
        -- Completion
        vim.o.completeopt = "menuone,noinsert,noselect"
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local cmp = require('cmp')
        cmp.setup({
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
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

            -- Menu appearance
            formatting = {
                format = function(entry, vim_item)
                    -- vim_item: menu, abbr, kind
                    -- entry: cmp.Source

                    -- Show the completion source
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        path = "[Path]",
                    })[entry.source.name]

                    -- Show completion context
                    -- TODO: completion_context might be something else than a string
                    -- For rust_analyzer, it is a string
                    local completion_context = get_lsp_completion_context(entry.completion_item, entry.source)
                    if completion_context ~= nil then
                        vim_item.menu = vim_item.menu .. " " .. completion_context
                    end

                    -- Truncates fields
                    vim_item.abbr = truncate_completion_menu_field(vim_item.abbr, true)
                    vim_item.menu = truncate_completion_menu_field(vim_item.menu, false)

                    return vim_item
                end,
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            }
        })

        -- LSP
        local lspconfig = require("lspconfig")

        -- Global mappings
        -- (g)o to (n)ext (d)iagnostic
        vim.keymap.set('n', '<leader>gnd', vim.diagnostic.goto_prev)
        -- (g)o to (p)rev (d)iagnostic
        vim.keymap.set('n', '<leader>gpd', vim.diagnostic.goto_next)
        -- (o)pen (d)iagnostic
        vim.keymap.set('n', '<leader>od', vim.diagnostic.open_float)

        -- Keymaps active only when a server is attached
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP Actions',
            callback = function(event)
                local opts = { buffer = event.buf }

                -- (g)o to (d)efinition
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)

                -- (g)o to (T)ype definition
                vim.keymap.set('n', 'gT', vim.lsp.buf.type_definition, opts)

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
                -- TODO: find a way to write all affected buffers (:wa)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            end
        })

        -- Change borders
        local handlers = {
            ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
            ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
        }

        -- Rust analyzer
        lspconfig.rust_analyzer.setup {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                ['rust-analyzer'] = {
                    inlayHints = {
                        chainingHints = true,
                        parameterHints = true,
                        typeHints = true,
                    },
                }
            }
        }

        -- Lua ls
        lspconfig.lua_ls.setup {
            capabilities = capabilities,
            handlers = handlers,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" }
                    }
                }
            }
        }

        -- TS Server
        lspconfig.tsserver.setup {
            capabilities = capabilities,
            handlers = handlers,
        }

        -- Golang
        lspconfig.gopls.setup {
            capabilities = capabilities,
            handlers = handlers,
        }

    end
}
