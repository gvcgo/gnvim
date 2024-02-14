-- file related
local M = {}

M.exists = function(path)
    local r = false
    if type(path) ~= "string" then return r end
    local f, err = io.open(path)
    if f == nil then return r end
    r = true
    f:close()
    return r
end

return M
