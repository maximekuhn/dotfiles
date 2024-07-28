--- @param completion lsp.CompletionItem
--- @param source cmp.Source
function get_import_path(completion, source)
    local ok, source_name = pcall(function() return source.source.client.config.name end)
    if not ok then
        return nil
    end

    if source_name == "rust_analyzer" then
        if completion.labelDetails ~= nil then
            return completion.labelDetails.detail
        end
    end

    return nil
end

return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.opt.completeopt = "menu,menuone,noinsert"

        local cmp = require("cmp")

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = {
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
                { name = "nvim_lsp" },
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            formatting = {
                format = function(entry, vim_item)
                    local cmp_kinds = {
                        Text = '  ',
                        Method = '  ',
                        Function = '  ',
                        Constructor = '  ',
                        Field = '  ',
                        Variable = '  ',
                        Class = '  ',
                        Interface = '  ',
                        Module = '  ',
                        Property = '  ',
                        Unit = '  ',
                        Value = '  ',
                        Enum = '  ',
                        Keyword = '  ',
                        Snippet = '  ',
                        Color = '  ',
                        File = '  ',
                        Reference = '  ',
                        Folder = '  ',
                        EnumMember = '  ',
                        Constant = '  ',
                        Struct = '  ',
                        Event = '  ',
                        Operator = '  ',
                        TypeParameter = '  ',
                    }

                    -- show kind as icon (function, module, ...)
                    vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind

                    -- show source name and import path (if any)
                    vim_item.menu = ({
                        buffer = "[Buffer]",
                        path = "[Path]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                    })[entry.source.name] .. ' ' .. (get_import_path(entry.completion_item, entry.source) or '')

                    return vim_item
                end
            },
        })

    end,
}
