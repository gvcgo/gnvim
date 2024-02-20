-- keymap register for neovim

--[[
keyObj
{
    Mode = <string>,
    Key = <string>,
    Command = <string or function>,
    Group = <string>,
    Desc = <string>,
}
]]

vim.g.mapleader = " "

if not vim.g.gkeys then
    vim.g.gkeys = {
        keylist = {},
    }
end

local testKey = function(t, key) 
    for _, v in ipairs(t) do
		if v == key then
			return true
		end
	end
	return false
end

local register = function(keyObj)
    if not keyObj.Mode or not keyObj.Key or not keyObj.Command then
        vim.notify("invalid key object.", true)
    end
    -- default values
    if not keyObj.Group then
        keyObj.Group = "Comman"
    end
    if not keyObj.Desc then
        keyObj.Desc = "no desc"
    end

    local gkeys = vim.g.gkeys
    if not gkeys.keylist then 
        gkeys.keylist = {}
    end
    local keylist = gkeys.keylist

    -- find duplicate
    if not testKey(keylist, keyObj.Key) then
        table.insert(keylist, keyObj.Key)
    else
        vim.notify("key already exists.", true)
        return
    end

    -- add to group
    if not gkeys[keyObj.Group] then
        gkeys[keyObj.Group] = {}
    end
    table.insert(gkeys[keyObj.Group], keyObj)

    -- set keymap
    vim.keymap.set(keyObj.Mode, keyObj.Key, keyObj.Command)
end



register({
    Mode = "n",
    Key = "<leader>tr",
    Command = ":NvimTreeToggle<CR>",
    Group = "Comman",
    Desc = "toggles file explorer",
})

local M = {
    Register = register,
}

return M
