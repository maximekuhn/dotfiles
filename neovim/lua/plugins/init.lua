return {
    -- Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
    },
    -- Telescope (fuzzy finding)
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter", 
        build = ":TSUpdate"
    }
}
