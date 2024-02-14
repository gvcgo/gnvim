-- set proxy for git
local gvcpaths = require("utils.gvc")
local files = require("utils.files")

if not files.exists(gvcpaths.gvcdir) then
    vim.notify("gvc not found.", true)
    return
end

-- test for git config files
local fixexist = function()
    local r = false
    if files.exists(gvcpaths.dotsshconfigback) then
        r = true
        return r
    end

    if files.exists(gvcpaths.dotsshconfig) then
        local c = string.find(files.readtxt(gvcpaths.dotsshconfig), "github.com")
        if c ~= nil then
            r = true
        end
    end
    return r
end

local setproxy = function(a) 
    local proxy = a.fargs[1]
    if not proxy or proxy == '""' then 
        vim.notify("proxy not specified.", true)
        return 
    end
    proxy = string.gsub(proxy, '"', '')

    local toset = false
    if not files.exists(gvcpaths.gvcproxy) then
        toset = true
    elseif files.exists(gvcpaths.gvcproxy) and files.readtxt(gvcpaths.gvcproxy) ~= "" then
        toset = true
    else
        vim.notify("proxy already set.", true)
    end

    if toset then
        local c = vim.fn.system { "g", "git", "proxy", proxy }
        vim.notify(c, true)
    end
    
    if not fixexist() then
        local c = vim.fn.system { "g", "git", "ssh-proxy-fix" }
        vim.notify(c, true)
    end
end

local toggleproxy = function()
    if not fixexist() then
        vim.notify("proxy has not been set yet.", true)
        return
    end
    local c = vim.fn.system { "g", "git", "toggle-ssh-proxy" }
    vim.notify(c, true)
end

-- set proxy for git
vim.api.nvim_create_user_command("SetProxy", setproxy, {})
-- enable/disable proxy for git
vim.api.nvim_create_user_command("ToggleProxy", toggleproxy, {})
