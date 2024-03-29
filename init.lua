-- Options and Keymaps
require("core.options")
require("core.register")
require("core.keys")

-- Set proxy for git ssh.
require("gnvim.gitproxy")

-- lazy: plugins management.
require("gnvim.lazy")

-- language server
require("gnvim.lsp")

-- completions
require("gnvim.cmp")

-- status bar: lualine
require('lualine').setup({
    options = {
      theme = 'tokyonight'
    }
})

-- document tree: nvim-tree
-- disabled by default
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
require("nvim-tree").setup()

-- syntax highlighting
require("gnvim.treesitter")

-- comment
require("Comment").setup()

-- tab line
require("gnvim.tab")

-- telescope
require("gnvim.telescope")

-- trouble
require("gnvim.trouble")

-- easymotion: flash
require("flash").setup()

-- lazygit
require("gnvim.lazygit")

-- todo list
require("gnvim.todo")

-- dap
require("gnvim.debug")

-- vim tutorial
require("gnvim.vimkeys")

-- keep cheatsheet to the last.
-- cheatsheet menu
vim.api.nvim_create_user_command("CheatSheet", require("core.keyui").show, {})

-- dashboard
require("alpha")
