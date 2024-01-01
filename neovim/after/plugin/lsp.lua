local lsp_zero = require("lsp-zero")

-- keybindings only active when LSP is running
lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({buffer = bufnr})
end)

-- automatic LSP setup using Mason
require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
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
