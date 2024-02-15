-- Document Tree: https://github.com/nvim-tree/nvim-tree.lua
-- <Tab>: unfold/fold <o> open file
-- Navigator(navigate between buffers): https://github.com/christoomey/vim-tmux-navigator
return {
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
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
