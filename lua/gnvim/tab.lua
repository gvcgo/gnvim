-- Tabline
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

-- smart split
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

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)

