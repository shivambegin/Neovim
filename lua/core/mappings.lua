local map = vim.keymap.set
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Remap space as leader key
map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '

-- General
-- map('n', '<leader>ts', ':set spell!<CR>') -- Toggle spell check
map('n', 'n', 'nzzzv') -- keep the cursor centered when doing 'n'
map('n', 'N', 'Nzzzv') -- keep the cursor centered when doing 'N'
map('n', 'J', 'mzJ`z') -- keep the cursor in same position when joining lines
map('n', 'cn', '*``cgn') -- change next match by pressing dot (.)
map('n', 'cN', '*``cgN') -- change previous match by pressing dot (.)
map('n', '<leader>vp', '`[v`]<CR>', {desc = 'Select pasted text'})
-- map('v', '<leader>p', '"_dP') -- delete into black hole and past last yank
map('n', '<leader>Y', 'gg"+yG', {desc = 'Copy whole buffer'})
map('n', '<leader>V', 'ggVG', {desc = 'Select whole buffer'})
-- map('n', '<leader>D', 'gg"_dG') -- delete into black hole register
-- map('v', '<leader>D', '"_d') -- delete into black hole register
map('n', '<C-d>', '<C-d>zz', {desc = 'Scroll down'})
map('n', '<C-u>', '<C-u>zz', {desc = 'Scroll up'})
map(
  'n', '<leader>z', ':%s/<C-R><C-W>/<C-R>0/g<CR>',
  {desc = 'Replace word under cursor with register "0" content globally'}
)
map('n', '<leader>h', '<cmd>nohlsearch<CR>', {desc = 'Hide highlights'})

-- Better window management
map('n', '<C-h>', '<C-w>h', {desc = 'Move to left split'})
map('n', '<C-j>', '<C-w>j', {desc = 'Move to below split'})
map('n', '<C-k>', '<C-w>k', {desc = 'Move to above split'})
map('n', '<C-l>', '<C-w>l', {desc = 'Move to right split'})
map('n', '<C-Up>', '<cmd>resize -2<CR>', {desc = 'Resize split up'})
map('n', '<C-Down>', '<cmd>resize +2<CR>', {desc = 'Resize split down'})
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', {desc = 'Resize split left'})
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', {desc = 'Resize split right'})

-- Buffers
map('n', '<leader>ba', ':bufdo bd<CR>', {desc = 'close all buffers'})
map('n', '<leader>bo', ':w <bar> %bd <bar> e# <bar> bd#<CR>', {desc = 'Close all buffers except current one'})
map('n', '<C-s>', '<cmd>w!<CR>', {desc = 'Force save'})
map('n', '<leader>q', '<cmd>q!<CR>', {desc = 'Close buffer/window'})
map('n', '<leader>w', '<cmd>w<CR>', {desc = 'Save buffer'})
map('n', '<C-q>', '<cmd>q!<CR>', {desc = 'Force quit'})
map('n', '<S-l>', ':bnext<CR>', {desc = 'Go to next buffer'})
map('n', '<S-h>', ':bprevious<CR>', {desc = 'Go to previous buffer'})

-- Visual --
-- Stay in indent mode
map('v', '<', '<gv', {desc = '(V) Indent to left'})
map('v', '>', '>gv', {desc = '(V) Indent to right'})
map('v', 'J', ':m \'>+1<CR>gv=gv', {desc = '(V) Move selection up'})
map('v', 'K', ':m \'<-2<CR>gv=gv', {desc = '(V) Move selection down'})

-- Quickfix
map('n', '<A-q>', ':lua require("utils").toggle_qf()<CR>', {desc = 'Toggle quickfix list'})
-- remap("n", "<A-o>", ":copen<CR>") -- open quickfix
map('n', '<A-j>', ':cnext<CR>', {desc = 'Next quickfix item'})
map('n', '<A-k>', ':cprev<CR>', {desc = 'previous quickfix item'})

-- LocationList
map('n', '<Leader>lo', ':lopen<CR>', {desc = 'Open location list'})
map('n', '<Leader>lc', ':lclose<CR>', {desc = 'Close location list'})
map('n', '<Leader>ln', ':lnext<CR>', {desc = 'Next location list item'})
map('n', '<Leader>lp', ':lprev<CR>', {desc = 'Previous location list item'})

-------------------------------------------------------------------------
--                               PLUGINS
-------------------------------------------------------------------------

-- Packer
map('n', '<leader>pc', '<cmd>PackerCompile<cr>', {desc = 'Packer compile'})
map('n', '<leader>pi', '<cmd>PackerInstall<cr>', {desc = 'Install packer plugins'})
map('n', '<leader>ps', '<cmd>PackerSync<cr>', {desc = 'Sync packer plugins'})
map('n', '<leader>pS', '<cmd>PackerStatus<cr>', {desc = 'Packer status'})
map('n', '<leader>pu', '<cmd>PackerUpdate<cr>', {desc = 'Update packer plugins'})

-- Nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- bufdelete.nvim
map('n', '<leader>c', '<cmd>Bdelete!<CR>', {desc = 'Close buffer (vim-bbye)'})
