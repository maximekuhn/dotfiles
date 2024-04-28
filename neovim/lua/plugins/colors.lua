return {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("cyberdream").setup({
            -- Recommended - see "Configuring" below for more config options
            transparent = false,
            italic_comments = true,
            hide_fillchars = false,
            borderless_telescope = false,
            terminal_colors = true,
        })
        vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
}
-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     lazy = false,
--     priority = 1000,
--
--     config = function()
--         -- configure colorscheme
--         require("rose-pine").setup({
--             highlight_groups = {
--                 -- Line number color
--                 LineNr = {
--                     fg = "#f6c177"
--                 }
--             },
--
--             -- Remove background
--             disable_background = true,
--         })
--         -- load colorscheme
--         vim.cmd("colorscheme rose-pine")
--     end
-- }
