local files = require("utils.files")
local sysinfo = require("utils.sysinfo")

local mdpath = vim.fn.stdpath("config") .. sysinfo.delimeter .. "lua" .. sysinfo.delimeter .. "misc" .. sysinfo.delimeter .. "vim.md"

print(mdpath)

local cmd = ":Glow " .. mdpath .. "<CR>"

local register = require("core.register").Register
register({
    Mode = "n",
    Key = "<leader>tu",
    Command = cmd,
    Group = "Markdown",
    Desc = "show a tutorial for vim.",
})
