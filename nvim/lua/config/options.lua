local opt = vim.opt

-- Tab
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.signcolumn = "yes"

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.clipboard:append("unnamedplus")
opt.modifiable = true
opt.encoding = "UTF-8"
