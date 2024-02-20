-- Some Keys

local register = require("core.mappings").Register

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

register({
    Mode = "n",
    Key = "<C-[>",
    Command = ":bp<CR>",
    Group = "Comman",
    Desc = "goes to previous buffer",
})

register({
    Mode = "n",
    Key = "<C-]>",
    Command = ":bn<CR>",
    Group = "Comman",
    Desc = "goes to next buffer",
})

register({
    Mode = "n",
    Key = "tb",
    Command = ":bdelete %<CR>",
    Group = "Comman",
    Desc = "closes current buffer",
})
