-- Syntax Highlighting: https://github.com/nvim-treesitter/nvim-treesitter
-- Rainbow Parentheses: https://github.com/HiPhish/rainbow-delimiters.nvim
-- Blankline: https://github.com/lukas-reineke/indent-blankline.nvim

return {
    {
        'HiPhish/rainbow-delimiters.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' }
    },
    { 
        "lukas-reineke/indent-blankline.nvim", 
        main = "ibl", 
    },
}
