-- Debug adapter protocol
-- DAP: https://github.com/mfussenegger/nvim-dap
-- Docs: https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt
-- DAP-UI: https://github.com/rcarriga/nvim-dap-ui
-- VirtualText: https://github.com/theHamsta/nvim-dap-virtual-text
-- Mason-Dap: https://github.com/jay-babu/mason-nvim-dap.nvim

-- require("mason-nvim-dap").setup({
--     ensure_installed = { "python", "delve" },
-- })

local dap = require("dap")

require('dap-go').setup()

-- dap.configurations.python = {
--     -- launch exe
--     {
--         type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
--         request = "launch",
--         name = "Launch file",
--         program = "${file}", -- This configuration will launch the current file if used.
--     },
-- }

-- dap.configurations.go = {
--     {
--         type = "go",
--         name = "Debug test", -- configuration for debugging test files
--         request = "launch",
--         mode = "test",
--         cwd = '${workspaceFolder}',
--         program = "${file}"
--     },
--     -- works with go.mod packages and sub packages
--     {
--         type = "go",
--         name = "Debug test (go.mod)",
--         request = "launch",
--         mode = "test",
--         cwd = '${workspaceFolder}',
--         program = "./${relativeFileDirname}"
--     },
--  }

-- keymaps for dap
local register = require("core.register").Register

-- vim.keymap.set('n', '<F5>', function() require 'telescope'.extensions.dap.configurations {} end)
register({
    Mode = "n",
    Key = "<F5>",
    Command = function() require("telescope").extensions.dap.configurations({}) end,
    Group = "Debug",
    Desc = "starts debugging.",
})

-- vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
register({
    Mode = "n",
    Key = "<F10>",
    Command = function() require('dap').step_over() end,
    Group = "Debug",
    Desc = "steps over.",
})

-- vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
register({
    Mode = "n",
    Key = "<F11>",
    Command = function() require('dap').step_into() end,
    Group = "Debug",
    Desc = "steps into.",
})

-- vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
register({
    Mode = "n",
    Key = "<F12>",
    Command = function() require('dap').step_out() end,
    Group = "Debug",
    Desc = "steps out.",
})

-- vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
register({
    Mode = "n",
    Key = "<Leader>b",
    Command = function() require('dap').toggle_breakpoint() end,
    Group = "Debug",
    Desc = "toggles breakpoint.",
})

-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
register({
    Mode = "n",
    Key = "<Leader>B",
    Command = function() require('dap').set_breakpoint() end,
    Group = "Debug",
    Desc = "sets breakpoint.",
})

-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
register({
    Mode = "n",
    Key = "<Leader>lp",
    Command = function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
    Group = "Debug",
    Desc = "sets named breakpoint.",
})

-- vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
register({
    Mode = "n",
    Key = "<Leader>dr",
    Command = function() require('dap').repl.open() end,
    Group = "Debug",
    Desc = "opens repl.",
})

-- vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
register({
    Mode = "n",
    Key = "<Leader>dl",
    Command = function() require('dap').run_last() end,
    Group = "Debug",
    Desc = "runs last.",
})

-- vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function() require('dap.ui.widgets').hover() end)
register({
    Mode = { 'n', 'v' },
    Key = "<Leader>dh",
    Command = function() require('dap.ui.widgets').hover() end,
    Group = "Debug",
    Desc = "hover.",
})

-- vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function() require('dap.ui.widgets').preview() end)
register({
    Mode = { 'n', 'v' },
    Key = "<Leader>dp",
    Command = function() require('dap.ui.widgets').preview() end,
    Group = "Debug",
    Desc = "preview.",
})

-- vim.keymap.set('n', '<Leader>df', function()
--     local widgets = require('dap.ui.widgets')
--     widgets.centered_float(widgets.frames)
-- end)
register({
    Mode = "n",
    Key = "<Leader>df",
    Command = function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
    end,
    Group = "Debug",
    Desc = "frames centered-float.",
})

-- vim.keymap.set('n', '<Leader>ds', function()
--     local widgets = require('dap.ui.widgets')
--     widgets.centered_float(widgets.scopes)
-- end)
register({
    Mode = "n",
    Key = "<Leader>ds",
    Command = function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
    end,
    Group = "Debug",
    Desc = "scopes centered-float..",
})

local dapui = require("dapui")
require("nvim-dap-virtual-text").setup()
require("dapui").setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

require("nvim-dap-virtual-text").setup({
    show_stop_reason = false,
})
