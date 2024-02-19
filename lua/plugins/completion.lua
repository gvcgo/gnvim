-- Completion: https://github.com/hrsh7th/nvim-cmp
-- Autopairs: https://github.com/windwp/nvim-autopairs
-- Surround: https://github.com/kylechui/nvim-surround

return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            {
                "saadparwaiz1/cmp_luasnip",
                dependencies = {
                    "L3MON4D3/LuaSnip",
                    dependencies = {
                        "rafamadriz/friendly-snippets",
                    }
                }
            },
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
    },
    {
        "kylechui/nvim-surround",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-treesitter/nvim-treesitter-textobjects",            
        },
    },
}
