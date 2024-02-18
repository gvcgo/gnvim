-- LSP(Language Server Protocol) related.
-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim
return {
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { 
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
        }
    }
}
