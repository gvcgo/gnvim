-- Telescope: https://github.com/nvim-telescope/telescope.nvim

return {
    { 
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
    },
    { "nvim-telescope/telescope-live-grep-args.nvim" },
    -- { "nvim-telescope/telescope-fzf-native.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "nvim-telescope/telescope-rg.nvim" },
    { "nvim-telescope/telescope-dap.nvim" },
}
