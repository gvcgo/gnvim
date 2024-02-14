-- file related
local M = {}

M.exists = function(path)
    local r = false
    if type(path) ~= "string" then return r end
    local f, err = io.open(path)
    if not f then return r end
    r = true
    f:close()
    return r
end

M.readtxt = function(path)
    local content = ""
    if type(path) ~= "string" then return content end
    local f, err = io.open(path, "r")
    if not f then return content end

    io.input(f)
    content = io.read("*a")
    io.close(f)
    return content
end

return M
