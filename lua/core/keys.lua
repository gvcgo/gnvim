-- Some Keys

local register = require("core.register").Register

-- Set keys
register({
    Mode = "i",
    Key = "jk",
    Command = "<ESC>",
    Group = "Comman",
    Desc = "escapes insert mode",
})

register({
    Mode = "v",
    Key = "J",
    Command = ":m '>+1<CR>gv=gv",
    Group = "Comman",
    Desc = "moves selected lines down",
})

register({
    Mode = "v",
    Key = "K",
    Command = ":m '<-2<CR>gv=gv",
    Group = "Comman",
    Desc = "moves selected lines up",
})

register({
    Mode = "n",
    Key = "<leader>sv",
    Command = "<C-w>v",
    Group = "Comman",
    Desc = "splits window vertically and select window",
})

register({
    Mode = "n",
    Key = "<leader>sh",
    Command = "<C-w>s",
    Group = "Comman",
    Desc = "splits window horizontally and select window",
})

register({
    Mode = "n",
    Key = "<leader>nh",
    Command = ":nohl<CR>",
    Group = "Comman",
    Desc = "removes search highlighting",
})

-- code folding
register({
    Mode = "n",
    Key = "zc",
    Command = "fold",
    Group = "Comman",
    Desc = "folds current code block.",
    ShowOnly = true,
})

register({
    Mode = "n",
    Key = "zo",
    Command = "unfold",
    Group = "Comman",
    Desc = "unfolds current code block.",
    ShowOnly = true,
})

register({
    Mode = "n",
    Key = "zM",
    Command = "fold",
    Group = "Comman",
    Desc = "folds all code block.",
    ShowOnly = true,
})

register({
    Mode = "n",
    Key = "zr",
    Command = "unfold",
    Group = "Comman",
    Desc = "unfolds code blocks.",
    ShowOnly = true,
})

-- keymap for cheatsheet
local register = require("core.register").Register
register({
    Mode = "n",
    Key = "<leader>c",
    Command = ":CheatSheet<CR>",
    Group = "Comman",
    Desc = "shows keymaps for gnvim.",
})
