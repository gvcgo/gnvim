-- Options and Keymaps
require("core.options")
require("core.mappings")

-- Set proxy for git ssh.
require("gnvim.gitproxy")

-- lazy: plugins management.
require("gnvim.lazy")

-- language server
require("gnvim.lsp")

-- status bar: lualine
require('lualine').setup({
    options = {
      theme = 'tokyonight'
    }
})
