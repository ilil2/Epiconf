local opt = vim.opt

-- lines
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- backspace
opt.backspace = "indent,eol,start"

-- presse clipboard
opt.clipboard = "unnamedplus"

-- wondow split
opt.splitright = true
opt.splitbelow = true

-- other
opt.cursorline = true
vim.opt.colorcolumn = "80"
opt.swapfile = false
