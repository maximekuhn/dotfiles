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
            }
        })
        -- load colorscheme
        vim.cmd("colorscheme rose-pine")
    end
}