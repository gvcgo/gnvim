-- Completion.
-- https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples

local extend_tbl = function(default, opts)
    opts = opts or {}
    return default and vim.tbl_deep_extend("force", default, opts) or opts
end

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

require("luasnip.loaders.from_vscode").lazy_load()
local luasnip = require("luasnip")

local cmp = require("cmp")

-- keymaps

local keyNext = "<C-]>"
local keyPrev = "<C-[>"
local keyConfirm = "<CR>"

local register = require("core.register").Register

register({
    Mode = "n",
    Key = keyNext,
    Command = "show only",
    Group = "Completion",
    Desc = "moves cursor to next item.",
    ShowOnly = true,
})

register({
    Mode = "n",
    Key = keyPrev,
    Command = "show only",
    Group = "Completion",
    Desc = "moves cursor to next item.",
    ShowOnly = true,
})

register({
    Mode = "n",
    Key = keyConfirm,
    Command = "show only",
    Group = "Completion",
    Desc = "chooses current item.",
    ShowOnly = true,
})

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' },
        { name = "buffer" },
    },
    mapping = cmp.mapping.preset.insert {
        [keyNext] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        [keyPrev] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        [keyConfirm] = cmp.mapping.confirm({ select = true }), 
    },
    experimental = {
        ghost_text = true,
    }
}

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    }
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
    })
})

-- Autopairs
local npairs = require("nvim-autopairs")
local Rule = require('nvim-autopairs.rule')

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string', 'source'},-- it will not add a pair on that treesitter node
        javascript = {'string', 'template_string'},
        java = false,-- don't check treesitter on java
    },
    disable_filetype = {'TelescopePrompt', 'spectre_panel'},
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%>%]%)%}%,]]=],
        end_key = '$',
        before_key = 'h',
        after_key = 'l',
        cursor_pos_before = true,
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        manual_position = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
})

local ts_conds = require('nvim-autopairs.ts-conds')


-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
--

-- surround
require("nvim-surround").setup()
