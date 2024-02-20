-- keymap cheatsheet

local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local gkeys = _G.gkeys
if not gkeys then
    return {}
end

-- items

local generateItemLines = function(group)
    local lines = {}
    local gr = gkeys[group]
    for _, v in pairs(gr) do
        local s = string.format('[%s] "%s", %s', v.Mode, v.Key, v.Desc )
        table.insert(lines, Menu.item(s))
    end
    return lines
end

local itemWindowOptions = {
    position = "50%",
    size = { width = "70%", height = "40%" },
    border = { 
        style = "single",
        text = {
            top = "keys",
            top_align = "center",
        },
    },
    win_options = {
        winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
    win_config = {
        focusable = true,
    },
}

local itemDataOptions = {
    lines = {},
    max_width = 20,
    keymap = {
        focus_next = { "j", "<Down>", "<Tab>" },
        focus_prev = { "k", "<Up>", "<S-Tab>" },
        close = { "<Esc>", "<C-c>" },
        -- submit = { "<CR>", "<Space>" },
    },
    on_close = function() print("Menu Closed!") end,
    -- on_submit = function(item) print("Menu Submitted: ", item.text) end,
}

local generateGroupLines = function()
    local lines = {}
    for k, _ in pairs(gkeys) do
        if k ~= "keylist" then
            table.insert(lines, Menu.item(k))
        end
    end
    return lines
end

local groupMenuWindowOptions = {
    position = "50%",
    size = { width = 20, height = "40%" },
    border = { 
        style = "single",
        text = {
            top = "group",
            top_align = "center",
        },
    },
    win_options = {
        winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
    win_config = {
        focusable = true,
    },
}

local groupMenuDataOptions = {
    lines = generateGroupLines(),
    max_width = 20,
    keymap = {
        focus_next = { "j", "<Down>", "<Tab>" },
        focus_prev = { "k", "<Up>", "<S-Tab>" },
        close = { "<Esc>", "<C-c>" },
        submit = { "<CR>", "<Space>" },
    },
    -- on_close = function() print("Menu Closed!") end,
    on_submit = function(item)
        itemDataOptions.lines = generateItemLines(item.text)
        local itemMenu = Menu(itemWindowOptions, itemDataOptions)
        itemMenu:mount()
    end,
}

local groupMenu = Menu(groupMenuWindowOptions, groupMenuDataOptions)


-- mount the component
-- groupMenu:mount()

local M = {}
M.show = function()
    groupMenu:mount()
end

-- command
vim.api.nvim_create_user_command("CheatSheet", M.show, {})

-- keymap for cheatsheet
local register = require("core.register").Register
register({
    Mode = "n",
    Key = "<leader>c",
    Command = ":CheatSheet<CR>",
    Group = "CheatSheet",
    Desc = "shows keymaps for gnvim.",
})

return M
