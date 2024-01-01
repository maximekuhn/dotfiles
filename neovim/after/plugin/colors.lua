local catppuccin = require("catppuccin")
catppuccin.setup({
    -- choose flavour
    flavour = "macchiato",

    -- integrate with auto completion and tree sitter
    integrations = {
        cmp = true,
        treesitter = true
    }
})

-- set colorscheme to 'catppuccin'
vim.cmd.colorscheme "catppuccin"

-- change line number color to white
vim.api.nvim_set_hl(0, 'LineNr', { fg = "white"})

