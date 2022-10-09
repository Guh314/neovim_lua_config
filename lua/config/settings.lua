local g = vim.g
local o = vim.o

-- Use terminal colors
o.termguicolors = true

-- Update Screen Time
o.timeoutlen = 500
o.updatetime = 200

-- UI
o.number = true
o.relativenumber = true
o.cursorline = true
o.signcolumn = 'yes'
o.numberwidth = 5

-- Tabs and Spaces
o.expandtab = true
o.tabstop = 4
o.softtabstop = -1
o.wrap = true
o.textwidth = 300
o.shiftwidth = 0

o.clipboard = 'unnamedplus'


--Backup and Undo
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false


-- Case insensitive search
o.ignorecase = true
o.smartcase = true


o.history = 50


-- Splits conf
o.splitright = true
o.splitbelow = true


-- Map Leader
g.mapleader = ' '
g.maplocalleader = ' '
