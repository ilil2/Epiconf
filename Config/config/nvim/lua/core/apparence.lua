local api = vim.api
local opt = vim.opt

--vim.cmd("colorscheme vim")

opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- custom colors

--[[ api.nvim_set_hl(0, "Normal", { bg="NONE" })

api.nvim_set_hl(0, "Pmenu", { bg = "#2c2c2c", fg = "#ffffff" })
api.nvim_set_hl(0, "PmenuSel", { bg = "#005f87", fg = "#ffffff" })

api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })

api.nvim_set_hl(0, "ColorColumn", { bg = "#333333", fg = "NONE" })

api.nvim_set_hl(0, "CursorLine", { bg = "#333333" })

api.nvim_set_hl(0, "Comment", { fg = "#22DD44" })

api.nvim_set_hl(0, "Whitespace", { fg = "#444444" })

]]

-- show whitespaces
opt.list = true
opt.listchars:append({ nbsp = "␣", trail = "•", precedes = "«", extends = "»", tab = "󰌥󰌒 " })

-- == Plugins ==
