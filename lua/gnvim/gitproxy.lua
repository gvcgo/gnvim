-- set proxy for git

local sysinfo = require("utils.sysinfo")

local gvcdir = "" -- gvc directory

local homedir = ""
if sysinfo ~= nil 
then
    if sysinfo.os == "windows"
    then
        homedir = os.getenv("HOMEPATH")
    else
        homedir = os.getenv("HOME")
    end
end
if homedir ~= "" and homedir ~= nil 
then
    gvcdir = homedir .. os.delimeter .. ".gvc"
end
