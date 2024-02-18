-- Show All Buffers: https://github.com/tomiis4/BufferTabs.nvim
return {
    {
        'tomiis4/BufferTabs.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        lazy = false,
        config = function()
            require('buffertabs').setup({
                ---@type 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|table
                border = 'none',

                ---@type integer
                padding = 1,

                ---@type boolean
                icons = true,

                ---@type string
                modified = " ",

                ---@type string use hl Group or hex color
                hl_group = 'Keyword',

                ---@type string use hl Group or hex color
                hl_group_inactive = 'Comment',

                ---@type boolean
                show_all = false,

                ---@type 'row'|'column'
                display = 'row',

                ---@type 'left'|'right'|'center'
                horizontal = 'center',

                ---@type 'top'|'bottom'|'center'
                vertical = 'top',

                ---@type number in ms (recommend 2000)
                timeout = 0
            })
        end
    },
}
