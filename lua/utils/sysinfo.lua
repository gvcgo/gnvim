local M = {}

-- system info
M.delimeter = package.config:sub(1,1)

local parseos = function()
if M.delimeter == '/' 
then
    local info = string.lower(vim.fn.system({"uname", "-a"}))
    if string.find(info, "darwin") ~= nil then 
        M.os = 'darwin'
    elseif string.find(info, "linux") ~= nil then
        M.os = 'linux'
    else
        M.os = 'other'
    end
else 
then
    M.os = 'windows'
end

parseos()

if M.os == 'windows' then
    M.homedir = os.getenv("HOMEPATH")
else
    M.homedir = os.getenv("HOME")
end

return M
