vim.g.mapleader = " "
local keymap = vim.keymap.set

-- Shortcuts
keymap("n", "<C-x>", ":x<CR>", {desc="Save and quit"});
keymap("i", "<C-x>", "<Esc>:x<CR>", {desc="Save and quit"});

keymap("n", "<C-q>", ":q!<CR>", {desc="Quit"});
keymap("i", "<C-q>", "<Esc>:q!<CR>", {desc="Quit"});

keymap("n", "<C-s>", ":w<CR>", {desc="Save"});
keymap("i", "<C-s>", "<Esc>:w<CR>i", {desc="Save"});

keymap("i", "<C-z>", "<Esc>:u<CR>i", {desc="Undo"});
keymap("i", "<C-y>", "<Esc>:redo<CR>i", {desc="Redo"});

keymap("v", "<C-c>", "y", {desc="Copy"});
keymap("n", "<C-v>", "p", {desc="Paste"});
keymap("i", "<C-v>", "<Esc>pi", {desc="Paste"});
keymap("v", "<C-v>", "p", {desc="Paste"});
keymap("v", "<C-x>", "<Del>", {desc="Cut"});

-- Plugin management
keymap("n", "<C-l>", ":Lazy<CR>", {desc="Open lazy.nvim menu"});
keymap("n", "<C-m>", ":Mason<CR>", {desc="Open mason.nvim menu"});

-- Closes brackets
keymap("i", "{", "{}<Left>", {desc="Close braces"});
keymap("i", "(", "()<Left>", {desc="Close patentheses"});
keymap("i", "[", "[]<Left>", {desc="Close brackets"});
keymap("i", "\"", "\"\"<Left>", {desc="Close double-quotes"});
keymap("i", "\'", "\'\'<Left>", {desc="Close simmple-quotes"});

-- Remove highlight on new search
keymap("n", "/", ":noh<CR>/", {desc="Search for a word"});

-- Navigating buffers
keymap("n", "<A-Left>", ":bprevious<CR>", { desc = "Move cursor to left buffer"})
keymap("n", "<A-Right>", ":bnext<CR>", { desc = "Move cursor to right buffer" })

keymap("n", "<C-w>", ":bdelete<CR>", { desc = "Close current buffer" })

-- Navigating windiws
keymap("n", "<A-Up>", ":wincmd h<CR>", { desc = "Move cursor to left window" })
keymap("n", "<A-Down>", ":wincmd l<CR>", { desc = "Move cursor to right window" })

-- Terminal
keymap("n", "<C-S-Enter>", ":vsplit term://bash<CR>:startinsert<CR>", { desc = "Open a new terminal in a new window" })
keymap("n", "<C-Enter>", ":wincmd l<CR>:startinsert<CR>", { desc = "Switch to opened terminal" })
keymap("t", "<Esc>", "<C-\\><C-n>:wincmd h<CR>", { desc = "Exit terminal" })

-- === Plugins ===
keymap('n', '<A-i>', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = "Compeltion menu" })
