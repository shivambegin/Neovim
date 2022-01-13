local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- General
keymap('n', 'n', 'nzzzv', opts) -- keep the cursor centered when doing 'n'
keymap('n', 'N', 'Nzzzv', opts) -- keep the cursor centered when doing 'N'
keymap('n', 'J', 'mzJ`z', opts) -- keep the cursor in same position when joining lines
keymap('n', 'cn', '*``cgn', opts) -- change next match by pressing dot (.)
keymap('n', 'cN', '*``cgN', opts) -- change previous match by pressing dot (.)
keymap('n', '<leader>vp', '`[v`]<CR>', opts) -- visually select previous pasted text
keymap('v', '<leader>p', '"_dP', opts) -- delete into black hole and past last yank
keymap('n', '<leader>Y', 'gg"+yG', opts) -- copy hole buffer
keymap('n', '<leader>V', 'ggVG', opts) -- select hole buffer
keymap('n', '<leader>D', 'gg"_dG', opts) -- delete into black hole register
keymap('v', '<leader>D', '"_d', opts) -- delete into black hole register
keymap('n', '<C-d>', '<C-d>zz', opts) -- move and center
keymap('n', '<C-u>', '<C-u>zz', opts) -- move and center
keymap('n', '<leader>ts', ':set spell!<CR>', opts) -- Toggle spell check
keymap('n', '<leader>th', ':set nohlsearch<CR>', opts) -- Toggle spell check
keymap('n', '<leader>z', ':%s/<C-R><C-W>/<C-R>0/g<CR>', opts) -- replace word under cursor with register "0" content globally


-- Normal --
-- Better window management
keymap("n", "<C-h>", "<C-w>h", opts) -- focus left window
keymap("n", "<C-j>", "<C-w>j", opts) -- focus bottom window
keymap("n", "<C-k>", "<C-w>k", opts) -- focus top winodw
keymap("n", "<C-l>", "<C-w>l", opts) -- focus right window
keymap('n', '<leader>ws', ':sp<CR>', opts) -- split window horizontally
keymap('n', '<leader>wv', ':vs<CR>', opts) -- split window vertically
keymap('n', '<leader>wH', '<C-w>H', opts) -- Move current window the far left and use the full height of the screen
keymap('n', '<leader>wJ', '<C-w>J', opts) -- Move current window the far bottom and use the full width of the screen
keymap('n', '<leader>wK', '<C-w>K', opts) -- Move current window the far top and full width of the screen
keymap('n', '<leader>wL', '<C-w>L', opts) -- Move current window the far right and full height of the screen
keymap('n', '<leader>wc', '<C-w>c', opts) -- Close current window in the current tabview
keymap('n', '<leader>wo', '<C-w>o', opts) -- Close every window in the current tabview but the current one
keymap('n', '<leader>wR', '<C-w>R', opts) -- Rotates the windows from right to left

keymap("n", "<leader>e", ":Lex 20<cr>", opts)

-- Resize with arrows
keymap('n', '<C-Right>', ':vertical resize -2<CR>', opts) -- Increase the window to the right
keymap('n', '<C-Left>', ':vertical resize +2<CR>', opts) -- Increase the window to the left
keymap('n', '<C-Up>', ':resize +2<CR>', opts) -- Increase the window to up
keymap('n', '<C-Down>', ':resize -2<CR>', opts) -- Increase the window to down

-- Buffers 
keymap('n', '<leader>s', ':w<CR>', opts) -- save buffer
keymap('n', '<leader>q', ':q!<CR>', opts) -- close buffer without saving
keymap('n', '<leader>x', ':bdelete<CR>', opts) -- close all buffers
keymap('n', '<leader>ba', ':bufdo bd<CR>', opts) -- close all buffers
keymap('n', '<leader>bo', ':w <bar> %bd <bar> e# <bar> bd#<CR>', opts) -- close all buffers except current one
keymap("n", "<S-l>", ":bnext<CR>", opts) -- next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- previous buffer

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap('v', 'J', ':m \'>+1<CR>gv=gv', opts) -- move line down
keymap('v', 'K', ':m \'<-2<CR>gv=gv', opts) -- move line up
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
