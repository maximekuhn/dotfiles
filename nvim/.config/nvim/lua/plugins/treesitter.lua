rshaunsingh/nord.nvimeturn {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/playground",
        -- seems to be broken with nvim 0.11
        "nvim-treesitter/nvim-treesitter-context"
    },
    build = ":TSUpdate",

    config = function()
        vim.treesitter.language.register("html", "gohtml")

        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "lua",
                "rust",
                "html",
                "css",
                "tsx",
                "go",
                "templ",
                "templ",
                "zig",
                "svelte",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
