-- keymap cheatsheet

local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local gkeys = _G.gkeys
if not gkeys then
    return {}
end

local comparator = function(a, b)
    return string.byte(a) - string.byte(b) < 0
end

local formatMode = function(mode)
    local t = type(mode)
    if t == "string" then
        return mode
    else
        local s = ""
        for _, v in pairs(mode) do
            s = s..v
        end
        return s
    end
end

local getCheatLines = function()
    local grouplist = {}
    for k, _ in pairs(gkeys) do
        if k ~= "keylist" then
            table.insert(grouplist, k)
        end
    end
    table.sort(grouplist, comparator)

    local lines = {}
    for _, k in pairs(grouplist) do
        table.insert(lines, Menu.separator(k, { char = "-", text_align = "left" }))
        local gr = gkeys[k]
        for _, v in pairs(gr) do
            local s = string.format('[%s] "%s", %s', formatMode(v.Mode), v.Key, v.Desc )
            table.insert(lines, Menu.item(s))
        end
    end
    return lines
end

local cheatSheetOptions = {
    position = "50%",
    size = { width = "80%", height = "90%" },
    border = { 
        style = "single",
        text = {
            top = "keymap cheatsheet",
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

local cheatDataOptions = {
    lines = getCheatLines(),
    max_width = 20,
    keymap = {
        focus_next = { "j", "<Down>", "<Tab>" },
        focus_prev = { "k", "<Up>", "<S-Tab>" },
        close = { "<Esc>", "<C-c>" },
        submit = { "<CR>" },
    },
    -- on_close = function() print("CheatSheet Closed!") end,
    -- on_submit = function(item) print("CheatSheet Submitted: ", item.text) end,
}

local cheatMenu = Menu(cheatSheetOptions, cheatDataOptions)

local M = {}
M.show = function()
    cheatMenu:mount()
end

return M
