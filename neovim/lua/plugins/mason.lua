return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },

    config = function()
        -- Setup Mason
        local mason = require("mason")
        mason.setup({
            ui = {
                border = "rounded"
            }
        })

        local mason_lspconfig = require("mason-lspconfig")
        mason_lspconfig.setup({
            ensure_installed = { "lua_ls", "rust_analyzer", "tsserver" },
        })
    end
}
