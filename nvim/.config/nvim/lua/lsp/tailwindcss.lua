vim.lsp.config("tailwindcss", {
    cmd = { "tailwindcss-language-server", "--stdio" },

    filetypes = {
        "html",
        "gohtml",
    },

    root_markers = {
        "tailwind.config.js",
        "tailwind.config.ts",
        "package.json",
        ".git",
    },
})

vim.lsp.enable("tailwindcss")
