-- Syntax highlighting

-- blankline: https://github.com/lukas-reineke/indent-blankline.nvim
local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

-- https://github.com/HiPhish/rainbow-delimiters.nvim
vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
-- 

-- https://github.com/nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup {
    -- one of "all" or a list of languages
    ensure_installed = { 
         "go", "vim", "c", "lua", "javascript",
     }, 
  
    highlight = { enable = true },
    indent = { enable = true },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    }
}

-- markdown preview
require('glow').setup()

local register = require("core.register").Register

register({
  Mode = "n",
  Key = "<leader>md",
  Command = ":Glow<CR>",
  Group = "Markdown",
  Desc = "previews current markdown file.",
})
