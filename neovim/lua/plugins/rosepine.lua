return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        -- configure colorscheme
        require("rose-pine").setup({
            highlight_groups = {
                -- Line number color
                LineNr = {
                    fg = "#f6c177"
                }
            },

            -- Remove background
            disable_background = true,
        })
        -- load colorscheme
        vim.cmd("colorscheme rose-pine")
    end
}
