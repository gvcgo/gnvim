require("core.options")
require("core.mappings")

vim.api.nvim_create_user_command("TestG", function(a)
    print(a.args)
end,{})
