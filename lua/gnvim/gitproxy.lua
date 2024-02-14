-- set proxy for git
local gvcpaths = require("utils.gvc")
local files = require("utils.files")

if not files.exists(gvcpaths.gvcdir) then
    vim.notify("gvc not found", true)
    return
end

