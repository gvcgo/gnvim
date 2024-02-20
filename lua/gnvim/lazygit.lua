-- ToggleTerm: https://github.com/akinsho/toggleterm.nvim

require("toggleterm").setup{
    direction = 'float',
    close_on_exit = true, -- close the terminal window when the process exits
     -- Change the default shell. Can be a string or a function returning a string
    shell = vim.o.shell,
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
        border =  'curved',
        -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
        winblend = 3,
        title_pos = 'center',
    },
    winbar = {
        enabled = true,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end
    },
}

local register = require("core.register").Register

-- terminal
local Terminal  = require('toggleterm.terminal').Terminal
local term = Terminal:new({})

function _term_toggle()
    term:toggle()
end

-- Terminal
-- vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _term_toggle()<CR>", {noremap = true, silent = true})
register({
    Mode = "n",
    Key = "<leader>te",
    Command = "<cmd>lua _term_toggle()<CR>",
    Group = "Terminal",
    Desc = "shows terminal.",
    Opts = {noremap = true, silent = true},
})

-- Lazygit
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

-- vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
register({
    Mode = "n",
    Key = "<leader>lg",
    Command = "<cmd>lua _lazygit_toggle()<CR>",
    Group = "Terminal",
    Desc = "shows lazygit.",
    Opts = {noremap = true, silent = true},
})
