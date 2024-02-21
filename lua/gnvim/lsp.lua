-- setup for LSP.

-- popui for  diagnostic, references, etc.
vim.ui.select = require("popui.ui-overrider")
vim.ui.input = require("popui.input-overrider")
vim.api.nvim_set_keymap("n", ",m", ':lua require"popui.marks-manager"()<CR>', { noremap = true, silent = true })


-- https://github.com/williamboman/mason.nvim
require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

-- https://github.com/williamboman/mason-lspconfig.nvim
require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
  },
})

-- https://github.com/hrsh7th/cmp-nvim-lsp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- language servers
-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#Suggested-configuration
local lspconfig = require('lspconfig')
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- lua: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
lspconfig.lua_ls.setup {
  capabilities = capabilities,
}
-- go: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
lspconfig.gopls.setup({})
--

local register = require("core.register").Register

-- vim.api.nvim_set_keymap("n", ",d", ':lua require"popui.diagnostics-navigator"()<CR>', { noremap = true, silent = true }) 
-- register({
--     Mode = "n",
--     Key = "<leader>le",
--     Command = vim.diagnostic.open_float,
--     Group = "Diagnostic",
--     Desc = "opens diagnostic buffer.",
-- })
register({
  Mode = "n",
  Key = "<leader>le",
  Command = ':lua require"popui.diagnostics-navigator"()<CR>',
  Group = "Diagnostic",
  Desc = "opens diagnostic buffer.",
  Opts = { noremap = true, silent = true },
})

register({
    Mode = "n",
    Key = "[d",
    Command = vim.diagnostic.goto_prev,
    Group = "Diagnostic",
    Desc = "goto previous diagnostic item.",
})

register({
    Mode = "n",
    Key = "]d",
    Command = vim.diagnostic.goto_next,
    Group = "Diagnostic",
    Desc = "goto next diagnostic item.",
})

register({
    Mode = "n",
    Key = "<leader>lq",
    Command = vim.diagnostic.setloclist,
    Group = "Diagnostic",
    Desc = "set loclist for diagnostic.",
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>le', vim.diagnostic.open_float)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>lq', vim.diagnostic.setloclist)

-- callback 

local lspCallback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    -- vim.api.nvim_set_keymap("n", ",r", ':lua require"popui.references-navigator"()<CR>', { noremap = true, silent = true })
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'gr', ':lua require"popui.references-navigator"()<CR>', opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>lwa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>lwr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>lwl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, opts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
end

--

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd(
    'LspAttach', 
    {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = lspCallback,
    })

-- neovim 0.10.0 inlay hints
local inlayHint = function()
    if vim.lsp.inlay_hint.is_enabled(0) then
      vim.lsp.inlay_hint.enable(0, false)
    else
      vim.lsp.inlay_hint.enable(0, true)
    end
end

if vim.lsp.inlay_hint then
    register({
        Mode = "n",
        Key = "<leader>lh",
        Command = inlayHint,
        Group = "Lsp",
        Desc = "inlay hint for neovim-0.10.0.",
        Opts = { desc = "Toggle Inlay Hints" },
    })
end

-- keymap for cheatsheet only, never registered.
register({
  Mode = "n",
  Key = "gd",
  Command = vim.lsp.buf.definition,
  Group = "LSP",
  Desc = "goes to definition.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "gr",
  Command = vim.lsp.buf.references,
  Group = "LSP",
  Desc = "shows references.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "K",
  Command = vim.lsp.buf.hover,
  Group = "LSP",
  Desc = "shows hovering info.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "<leader>rn",
  Command = vim.lsp.buf.rename,
  Group = "LSP",
  Desc = "renames a token.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "<leader>lf",
  Command = function() vim.lsp.buf.format { async = true } end,
  Group = "LSP",
  Desc = "formats code.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "gD",
  Command = vim.lsp.buf.declaration,
  Group = "LSP",
  Desc = "goes to declaration.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "gi",
  Command = vim.lsp.buf.implementation,
  Group = "LSP",
  Desc = "shows implementations.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "<C-k>",
  Command = vim.lsp.buf.signature_help,
  Group = "LSP",
  Desc = "shows signature help.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "<leader>lwa",
  Command = vim.lsp.buf.add_workspace_folder,
  Group = "LSP",
  Desc = "adds workspace folder.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "<leader>lwr",
  Command = vim.lsp.buf.remove_workspace_folder,
  Group = "LSP",
  Desc = "removes workspace folder.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "<leader>lwl",
  Command = function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
  Group = "LSP",
  Desc = "lists workspace folder.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = "n",
  Key = "<leader>D",
  Command = vim.lsp.buf.type_definition,
  Group = "LSP",
  Desc = "shows type of definition.",
  ShowOnly = true,
  RegLater = true,
})

register({
  Mode = {"n", "v"},
  Key = "<leader>ca",
  Command = vim.lsp.buf.code_action,
  Group = "LSP",
  Desc = "shows code action.",
  ShowOnly = true,
  RegLater = true,
})
