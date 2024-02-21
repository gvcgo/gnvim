-- Trouble: https://github.com/folke/trouble.nvim
require("trouble").setup()

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

-- keymaps
local register = require("core.register").Register

-- show keymaps in telescope for trouble plugin.
register({
    Mode = "t",
    Key = "{in telescope} <c-t>",
    Command = trouble.open_with_trouble,
    Group = "Trouble",
    Desc = "opens trouble in telescope.",
    ShowOnly = true,
})

-- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
-- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
-- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
-- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
-- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
-- vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)

register({
    Mode = "n",
    Key = "<leader>xx",
    Command = function() require("trouble").toggle() end,
    Group = "Trouble",
    Desc = "toggles trouble plugin.",
})

register({
    Mode = "n",
    Key = "<leader>xw",
    Command = function() require("trouble").toggle("workspace_diagnostics") end,
    Group = "Trouble",
    Desc = "toggles trouble workspace_diagnostics.",
})

register({
    Mode = "n",
    Key = "<leader>xd",
    Command = function() require("trouble").toggle("document_diagnostics") end,
    Group = "Trouble",
    Desc = "toggles trouble document_diagnostics.",
})

register({
    Mode = "n",
    Key = "<leader>xq",
    Command = function() require("trouble").toggle("quickfix") end,
    Group = "Trouble",
    Desc = "toggles trouble quickfix.",
})

register({
    Mode = "n",
    Key = "<leader>xl",
    Command = function() require("trouble").toggle("loclist") end,
    Group = "Trouble",
    Desc = "toggles trouble loclist.", 
})

register({
    Mode = "n",
    Key = "gR",
    Command = function() require("trouble").toggle("lsp_references") end,
    Group = "Trouble",
    Desc = "toggles trouble lsp_references.",
})
