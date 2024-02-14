-- GVC related.
local M = {}

local sysinfo = require("utils.sysinfo")

if sysinfo.homedir ~= nil and sysinfo.homedir ~= "" then
    -- GVC Homedir
    M.gvcdir = sysinfo.homedir .. sysinfo.delimeter .. ".gvc"
    -- GVC default proxy file
    M.gvcproxy = M.gvcdir .. sysinfo.delimeter .. ".default_proxy.conf"
    -- .ssh dir
    M.dotsshdir = sysinfo.homedir .. sysinfo.delimeter .. ".ssh"
    -- ssh config file for proxy
    M.dotsshconfig = M.dotsshdir .. sysinfo.delimeter .. "config"
    -- backup of ssh config file
    M.dotsshconfigback = M.dotsshdir .. sysinfo.delimeter .. "config.bak"
end

return M
