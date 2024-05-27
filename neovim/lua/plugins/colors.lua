return {
    "scottmckendry/cyberdream.nvim",
    dependencies = { "catppuccin/nvim" },
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

        local colors = "cyberdream"

        -- Set the colorscheme
        vim.cmd("colorscheme " .. colors)

        -- Set extra colors for Git fugitive
        vim.cmd("hi diffAdded ctermfg=188 ctermbg=64 cterm=bold guifg=#50FA7B guibg=NONE gui=bold")
        vim.cmd("hi diffRemoved ctermfg=88 ctermbg=NONE cterm=NONE guifg=#FA5057 guibg=NONE gui=NONE")

        -- toggle between light mode and dark mode
        vim.keymap.set('n', '<leader>tlm', function()
            if colors == "cyberdream" then
                colors = "catppuccin-latte"
                vim.cmd("colorscheme " .. colors)
            else
                colors = "cyberdream"
                vim.cmd("colorscheme " .. colors)
            end
        end)
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
