local opt = vim.opt

-- 行号
opt.relativenumber = true
opt.number = true

-- 缩进
-- opt.tabstop = 4
-- opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- code folding
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldenable = false

-- 防止包裹
opt.wrap = false

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.ignorecase = true
opt.smartcase = true
