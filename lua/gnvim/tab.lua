-- Tabline: https://github.com/willothy/nvim-cokeline

local get_hex = require('cokeline.hlgroups').get_hl_attr

local yellow = vim.g.terminal_color_3

local options = {
    default_hl = {
        fg = function(buffer)
          return
            buffer.is_focused
            and get_hex('Normal', 'fg')
             or get_hex('Comment', 'fg')
        end,
        bg = get_hex('ColorColumn', 'bg'),
    },
    
    components = {
        {
          text = '｜',
          fg = function(buffer)
            return
              buffer.is_modified and yellow or green
          end
        },
        {
          text = function(buffer) return buffer.devicon.icon .. ' ' end,
          fg = function(buffer) return buffer.devicon.color end,
        },
        {
          text = function(buffer) return buffer.index .. ': ' end,
        },
        {
          text = function(buffer) return buffer.unique_prefix end,
          fg = get_hex('Comment', 'fg'),
          italic = true,
        },
        {
          text = function(buffer) return buffer.filename .. ' ' end,
          bold = function(buffer) return buffer.is_focused end,
        },
        {
          text = ' ',
        },
    },

    sidebar = {
        filetype = {'NvimTree', 'neo-tree'},
        components = {
          {
            text = function(buf)
              return buf.filetype
            end,
            fg = yellow,
            bg = function() return get_hex('NvimTreeNormal', 'bg') end,
            bold = true,
          },
        }
    },
}

require('cokeline').setup(options)

-- smart split: https://github.com/mrjones2014/smart-splits.nvim
require('smart-splits').setup({
  resize_mode = {
    silent = true,
    hooks = {
      on_enter = function()
        vim.notify('Entering resize mode')
      end,
      on_leave = function()
        vim.notify('Exiting resize mode, bye')
      end,
    },
  },
})

-- keymaps

-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
-- vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
-- vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
-- vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
-- vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
-- vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
-- vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
-- vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
-- vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
-- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
-- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
-- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
-- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)

local msplit = require('smart-splits')
local register = require("core.register").Register

-- resizing a split.
register({
  Mode = "n",
  Key = "<A-h>",
  Command = msplit.resize_left,
  Group = "Tabs",
  Desc = "resizes a split by left.",
})

register({
  Mode = "n",
  Key = "<A-j>",
  Command = msplit.resize_down,
  Group = "Tabs",
  Desc = "resizes a split by bottom.",
})

register({
  Mode = "n",
  Key = "<A-k>",
  Command = msplit.resize_up,
  Group = "Tabs",
  Desc = "resizes a split by top.",
})

register({
  Mode = "n",
  Key = "<A-l>",
  Command = msplit.resize_right,
  Group = "Tabs",
  Desc = "resizes a split by right.",
})

-- moving cursor between splits
register({
  Mode = "n",
  Key = "<C-h>",
  Command = msplit.move_cursor_left,
  Group = "Tabs",
  Desc = "moves cursor to left split.",
})

register({
  Mode = "n",
  Key = "<C-j>",
  Command = msplit.move_cursor_down,
  Group = "Tabs",
  Desc = "moves cursor to split below.",
})

register({
  Mode = "n",
  Key = "<C-k>",
  Command = msplit.move_cursor_up,
  Group = "Tabs",
  Desc = "moves cursor to split up.",
})

register({
  Mode = "n",
  Key = "<C-l>",
  Command = msplit.move_cursor_right,
  Group = "Tabs",
  Desc = "moves cursor to right split.",
})

-- swapping buffers between windows
register({
  Mode = "n",
  Key = "<leader><leader>h",
  Command = msplit.swap_buf_left,
  Group = "Tabs",
  Desc = "swaps a split to left.",
})

register({
  Mode = "n",
  Key = "<leader><leader>j",
  Command = msplit.swap_buf_down,
  Group = "Tabs",
  Desc = "swaps a split to below.",
})

register({
  Mode = "n",
  Key = "<leader><leader>k",
  Command = msplit.swap_buf_up,
  Group = "Tabs",
  Desc = "swaps a split to above.",
})

register({
  Mode = "n",
  Key = "<leader><leader>l",
  Command = msplit.swap_buf_right,
  Group = "Tabs",
  Desc = "swaps a split to right.",
})

-- Nvim-tree: https://github.com/nvim-tree/nvim-tree.lua
local register = require("core.register").Register
register({
    Mode = "n",
    Key = "<leader>tr",
    Command = ":NvimTreeToggle<CR>",
    Group = "Comman",
    Desc = "toggles file explorer",
})
