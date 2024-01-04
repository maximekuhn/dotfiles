local lsp_zero = require("lsp-zero")

-- keybindings only active when LSP is running
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})

    -- custom keybindings
    local opts = {buffer = bufnr, remap = false}
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set({'n', 'x'}, 'gq', function()
        vim.lsp.buf.format({async = false, timeout_ms = 10000})
    end, opts)
end)

-- automatic LSP setup using Mason
local lsp_config = require("lspconfig")
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'rust_analyzer', 'lua_ls'},
    handlers = {
        lsp_zero.default_setup,

        -- Lua
        lua_ls = function()
            lsp_config.lua_ls.setup({})
        end,

        -- Rust
        rust_analyzer = function()
            require("rust-tools").setup({})
        end
    },
})

-- auto-completion
local cmp = require("cmp")
local cmp_action = lsp_zero.cmp_action()
local cmp_format = lsp_zero.cmp_format()
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = true, behavior = cmp.ConfirmBehavior.Insert}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),
    }),

    -- Preselect first item when completion menu shows up
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },

    -- Show source name in completion menu
    formatting = cmp_format,
})

