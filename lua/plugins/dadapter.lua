-- DAP: https://github.com/mfussenegger/nvim-dap
-- DAP-UI: https://github.com/rcarriga/nvim-dap-ui
-- VirtualText: https://github.com/theHamsta/nvim-dap-virtual-text
-- Mason-Dap: https://github.com/jay-babu/mason-nvim-dap.nvim

return {
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { 
            "mfussenegger/nvim-dap",
            -- "jay-babu/mason-nvim-dap.nvim",
            "theHamsta/nvim-dap-virtual-text",
            "nvim-telescope/telescope.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope-dap.nvim",
            -- "williamboman/mason.nvim",
            "leoluz/nvim-dap-go",
         },
    },
}
