-- Document Tree: https://github.com/nvim-tree/nvim-tree.lua
-- <Tab>: unfold/fold <o> open file
-- Navigator(navigate between buffers): https://github.com/christoomey/vim-tmux-navigator
return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
          -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    },
    {
        "christoomey/vim-tmux-navigator",
        cmd = {
          "TmuxNavigateLeft",
          "TmuxNavigateDown",
          "TmuxNavigateUp",
          "TmuxNavigateRight",
          "TmuxNavigatePrevious",
        },
        keys = {
          { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
          { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
          { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
          { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
          { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
}
