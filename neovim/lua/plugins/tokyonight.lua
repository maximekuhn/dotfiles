return {
    "folke/tokyonight.nvim",
    config = function()
        -- configure tokyonight
        require("tokyonight").setup({
            on_highlights = function(h1, c)
                h1.LineNr = {
                    fg = "#00b7ff"
                }
            end
        })
        -- load colorscheme
        vim.cmd([[colorscheme tokyonight]])
    end
}
