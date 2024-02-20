-- keymap register for neovim

--[[
keyObj
{
    Mode = <string>,
    Key = <string>,
    Command = <string or function>,
    Group = <string>,
    Desc = <string>,
    ShowOnly = <value>,
    Opts = {},
}
]]

vim.g.mapleader = " "

if not _G.gkeys then
    _G.gkeys = {
        keylist = {},
    }
end

gkeys = _G.gkeys
keylist = gkeys.keylist

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
    if keyObj.Opts == nil then
        keyObj.Opts = {}
    end
    
    if not gkeys.keylist then 
        gkeys.keylist = {}
    end
    
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
    if not keyObj.ShowOnly then
        vim.keymap.set(keyObj.Mode, keyObj.Key, keyObj.Command, keyObj.Opts)
    end
end

local M = {
    Register = register,
}

M.gkeys = gkeys

return M
