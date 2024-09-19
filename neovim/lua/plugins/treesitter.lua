return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "nvim-treesitter/playground", "nvim-treesitter/nvim-treesitter-context" },
    build = ":TSUpdate",

    config = function()
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
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
