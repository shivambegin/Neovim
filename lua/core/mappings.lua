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

-- Telescope
map('n', '<C-p>', ':Telescope find_files<CR>', {desc = 'Find files (Telescope)'})
map('n', '<leader>fg', ':Telescope git_files<CR>', {desc = 'Find git files (Telescope)'})
map('n', '<leader>fw', ':Telescope live_grep<CR>', {desc = 'Live grep (Telescope)'})
map('n', '<leader>gt', ':Telescope git_status<CR>', {desc = 'Git status (Telescope)'})
map('n', '<leader>gb', ':Telescope git_branches<CR>', {desc = 'Git branches (Telescope)'})
map('n', '<leader>gc', ':Telescope git_commits<CR>', {desc = 'Git commits (Telescope)'})
map('n', '<Leader>ff', ':Telescope current_buffer_fuzzy_find<CR>', {desc = 'Find  in current buffer'})
-- map('n', '<leader>ff', ':Telescope ', {desc = 'Find files (Telescope)'})
map('n', '<leader>fb', ':Telescope buffers<CR>', {desc = 'Buffer list'})
map('n', '<leader>fh', ':Telescope tags<CR>', {desc = 'Help tags'})
map('n', '<leader>fm', ':Telescope marks<CR>', {desc = 'Find marks'})
map('n', '<leader>fo', ':Telescope oldfiles<CR>', {desc = 'Find old files'})
-- map('n', '<leader>sb', ':Telescope ', {desc = 'Find git branches'})
map('n', '<leader>sh', ':Telescope help_tags<CR>', {desc = 'Help tags'})
map('n', '<leader>sm', ':Telescope man_pages<CR>', {desc = 'Man pages'})
map('n', '<leader>sn', function() require('telescope').extensions.notify.notify() end, {desc = 'Notification list'})
map('n', '<leader>sr', ':Telescope registers<CR>', {desc = 'Find registers'})
map('n', '<leader>sk', ':Telescope keymaps<CR>', {desc = 'Find key maps'})
map('n', '<leader>sc', ':Telescope commands<CR>', {desc = 'Find commands'})
map('n', '<leader>ls', ':Telescope lsp_document_symbols<CR>', {desc = 'LSP document symbols'})
map('n', '<leader>lR', ':Telescope lsp_references<CR>', {desc = 'LSP references'})
map('n', '<leader>lD', ':Telescope diagnostics<CR>', {desc = 'Workspace diagnostics'})
map('n', '<Leader>fR', ':Telescope resume<CR>', {desc = 'Resume last search'})
map('n', '<leader>:', ':Telescope command_history<CR>', {desc = 'Find command history'})
map('n', '<leader>/', ':Telescope search_history<CR>', {desc = 'Find search history'})
map('n', '<leader>is', ':Telescope symbols<CR>', {desc = 'Insert symbols'})
map('n', '<leader>fn', function() require'configs.telescope'.find_notes() end, {desc = 'Find notes'})
map('n', '<leader>fN', function() require'configs.telescope'.grep_notes() end, {desc = 'Search in notes'})
map('n', '<leader>on', function() require'configs.telescope'.edit_neovim() end, {desc = 'Edit neovim config'})
