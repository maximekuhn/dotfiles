return {
    "williamboman/mason.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },

    config = function()
        require("mason").setup()

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                -- "rust_analyzer", installed via rustup
                "ts_ls",
                "tailwindcss",
                "gopls",
                "templ",
                "zls",
                "svelte",
            },
        })
    end,
}
