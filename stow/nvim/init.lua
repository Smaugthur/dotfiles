
-- ''''''''''''
-- => BASICS
-- ''''''''''''

vim.g.mapleader = " "
vim.o.mouse="a"

require("config.lazy")
require("config.autocomds")


-- Themes and encoding
vim.o.termguicolors = true
vim.o.encoding="utf-8"
vim.o.foldmethod="marker"

-- Rulers
vim.o.relativenumber = true
vim.o.number = true
vim.o.numberwidth = 1
-- vim.o.cursorline = true
-- vim.o.cursorcolumn = true

-- Spliting Buffers
vim.o.splitright = true
vim.o.splitbelow = true

-- File History
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("~/.vim/undodir")
vim.o.swapfile = false
vim.o.clipboard = "unnamedplus"

-- Highlighting
-- syntax enable
-- syntax on

-- Indent
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.wrap = false

-- Others
vim.o.showcmd = true
vim.o.cmdheight = 2
vim.o.errorbells = false
vim.o.scrolloff = 8
vim.o.signcolumn = "yes"


-- ''''''''''''
-- => KEY MAPS
-- ''''''''''''

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs)
end

map('n', '<Leader>s', ':w<CR>')
map('n', '<Leader>e', ':BufferClose<CR>')

-- Move selected line / block of text in visual mode
-- and change its indentation level
-- < move left
-- > move rigth
map('v', '<', '<gv', {noremap=true})
map('v', '>', '>gv', {noremap=true})

-- Move selected line / block of text in visual mode
-- shift + k to move up
-- shift + j to move down
map('x', 'K', ':move \'<-2<CR>gv-gv', {noremap=true})
map('x', 'J', ':move \'>+1<CR>gv-gv', {noremap=true})

-- move among buffers with CTRL
-- space + p next tab
-- space + o previus tab
map('n', '<Leader>p', ':BufferNext<CR>')
map('n', '<Leader>o', ':BufferPrevious<CR>')

-- Colorscheme
vim.cmd('colorscheme tokyonight-night')
