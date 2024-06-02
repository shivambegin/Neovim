-- [[ Setting options ]]
-- See `:help vim.o`
--Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.backup = false --no backup
opt.modifiable = true --modify text and buffers
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.showtabline = 0 -- always show tabs
opt.title = true -- set the title of window to the value of the titlestring
opt.confirm = true -- confirm to save changes before exiting modified buffer
opt.laststatus = 3 -- global statusline
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undofile = true -- enable persistent undo
opt.updatetime = 100 -- faster completion (4000ms default)

-- line numbers
opt.relativenumber = false -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.incsearch = true -- make search act like modern browsers

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for colorscheme to work
opt.termguicolors = true
opt.showmode = false -- hide mode (mode is already show in lualine bar)
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.cmdheight = 0

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard = "unnamedplus" -- use system clipboard as default register

-- scroll
opt.scrolloff = 10 -- Makes sure there are always eight lines of context
opt.sidescrolloff = 10 -- Makes sure there are always eight lines of context

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
