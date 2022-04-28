local opts = {noremap = true, silent = true}

local term_opts = {silent = true}

-- Shorten function name
local map = vim.keymap.set

-- Remap space as leader key
map('', '<Space>', '<Nop>')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General
map('n', 'n', 'nzzzv') -- keep the cursor centered when doing 'n'
map('n', 'N', 'Nzzzv') -- keep the cursor centered when doing 'N'
map('n', 'J', 'mzJ`z') -- keep the cursor in same position when joining lines
map('n', 'cn', '*``cgn') -- change next match by pressing dot (.)
map('n', 'cN', '*``cgN') -- change previous match by pressing dot (.)
map('n', '<leader>vp', '`[v`]<CR>') -- visually select previous pasted text
map('v', '<leader>p', '"_dP') -- delete into black hole and past last yank
map('n', '<leader>Y', 'gg"+yG') -- copy hole buffer
map('n', '<leader>V', 'ggVG') -- select hole buffer
map('n', '<leader>D', 'gg"_dG') -- delete into black hole register
map('v', '<leader>D', '"_d') -- delete into black hole register
map('n', '<C-d>', '<C-d>zz') -- move and center
map('n', '<C-u>', '<C-u>zz') -- move and center
map('n', '<leader>ts', ':set spell!<CR>') -- Toggle spell check
map('n', '<leader>th', ':set nohlsearch<CR>') -- Toggle spell check
map('n', '<leader>z', ':%s/<C-R><C-W>/<C-R>0/g<CR>') -- replace word under cursor with register "0" content globally

-- Better window management
map('n', '<C-h>', '<C-w>h') -- focus left window
map('n', '<C-j>', '<C-w>j') -- focus bottom window
map('n', '<C-k>', '<C-w>k') -- focus top winodw
map('n', '<C-l>', '<C-w>l') -- focus right window
map('n', '<leader>ws', ':sp<CR>') -- split window horizontally
map('n', '<leader>wv', ':vs<CR>') -- split window vertically
map('n', '<leader>wH', '<C-w>H') -- Move current window the far left and use the full height of the screen
map('n', '<leader>wJ', '<C-w>J') -- Move current window the far bottom and use the full width of the screen
map('n', '<leader>wK', '<C-w>K') -- Move current window the far top and full width of the screen
map('n', '<leader>wL', '<C-w>L') -- Move current window the far right and full height of the screen
map('n', '<leader>wc', '<C-w>c') -- Close current window in the current tabview
map('n', '<leader>wo', '<C-w>o') -- Close every window in the current tabview but the current one
map('n', '<leader>wR', '<C-w>R') -- Rotates the windows from right to left

map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Resize with arrows
map('n', '<C-Right>', ':vertical resize -2<CR>') -- Increase the window to the right
map('n', '<C-Left>', ':vertical resize +2<CR>') -- Increase the window to the left
map('n', '<C-Up>', ':resize +2<CR>') -- Increase the window to up
map('n', '<C-Down>', ':resize -2<CR>') -- Increase the window to down

-- Buffers
map('n', '<leader>s', ':w<CR>') -- save buffer
map('n', '<leader>q', ':q!<CR>') -- close buffer without saving
map('n', '<leader>x', ':Bdelete<CR>') -- close all buffers
map('n', '<leader>ba', ':bufdo bd<CR>') -- close all buffers
map('n', '<leader>bo', ':w <bar> %bd <bar> e# <bar> bd#<CR>') -- close all buffers except current one
map('n', '<S-l>', ':bnext<CR>') -- next buffer
map('n', '<S-h>', ':bprevious<CR>') -- previous buffer

-- Visual --
-- Stay in indent mode
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Move text up and down
-- keymap('v', 'J', ':m \'>+1<CR>gv=gv') -- move line down
-- keymap('v', 'K', ':m \'<-2<CR>gv=gv') -- move line up
-- keymap('v', 'p', '"_dP')

-- Visual Block --
-- Move text up and down
map('x', 'J', ':move \'>+1<CR>gv-gv')
map('x', 'K', ':move \'<-2<CR>gv-gv')
map('x', '<A-j>', ':move \'>+1<CR>gv-gv')
map('x', '<A-k>', ':move \'<-2<CR>gv-gv')

-- Terminal --
-- Better terminal navigation
map('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
map('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
map('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
map('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)

-- Format
map('n', '<leader>F', ':Format<CR>')

-- Nvim-tree
map('n', '<leader>e', ':Neotree toggle<CR>')
map('n', '<leader>o', ':Neotree focus<CR>')

-- Fugitive
map('n', '<leader>gg', ':Git<CR>')
-- keymap('n', '<leader>gd', ':Git diff<CR>')
-- keymap('n', '<leader>gD', ':Gdiffsplit<CR>')
-- keymap('n', '<leader>ge', ':Gedit<CR>')
map('n', '<leader>gr', ':Gread<CR>')
map('n', '<leader>gw', ':Gwrite<CR>')
-- keymap('n', '<leader>gB', ':Git blame<Cr>')
map('n', '<leader>gl', ':Git log<CR>')
map('n', '<leader>gL', ':Gclog<CR>')

-- Telescope {{{
map('n', '<C-p>', ':Telescope find_files<CR>')
map('n', '<Leader>fG', ':Telescope grep_string<CR>')
map('n', '<Leader>fg', ':Telescope live_grep<CR>')
map('n', '<Leader>ff', ':Telescope current_buffer_fuzzy_find<CR>')
map('n', '<Leader>fF', ':Telescope file_browser<CR>')
map('n', '<Leader>fb', ':Telescope buffers<CR>')
map('n', '<Leader>fo', ':Telescope oldfiles<CR>')
map('n', '<leader>fcc', ':Telescope commands<CR>')
map('n', '<leader>:', ':Telescope command_history<CR>')
map('n', '<leader>/', ':Telescope search_history<CR>')
map('n', '<Leader>fp', ':Telescope pickers<CR>')
map('n', '<Leader>fP', ':Telescope project<CR>')
map('n', '<Leader>fj', ':Telescope jumplist<CR>')
map('n', '<Leader>fr', ':Telescope lsp_references<CR>')
map('n', '<Leader>fR', ':Telescope registers<CR>')
map('n', '<Leader>ft', ':Telescope treesitter<CR>')
map('n', '<Leader>fT', ':Telescope current_buffer_tags<CR>')
map('n', '<Leader>fws', ':Telescope lsp_workspace_symbols<CR>')
map('n', '<Leader>fca', ':Telescope lsp_code_actions<CR>')
map('n', '<Leader>fwd', ':Telescope lsp_workspace_diagnostics<CR>')
map('n', '<Leader>fi', ':Telescope lsp_implementations<CR>')
map('n', '<Leader>fds', ':Telescope lsp_document_symbols<CR>')
map('n', '<Leader>fdd', ':Telescope lsp_document_diagnostics<CR>')
map('n', '<Leader>fD', ':Telescope lsp_definitions<CR>')
map('n', '<Leader>ftd', ':Telescope lsp_definitions<CR>')
-- keymap('n', '<Leader>fgc', ':Telescope git_commits<CR>')
-- keymap('n', '<Leader>fgC', ':Telescope git_bcommits<CR>')
-- keymap('n', '<Leader>fgb', ':Telescope git_branches<CR>')
-- keymap('n', '<Leader>fgs', ':Telescope git_status<CR>')
-- keymap('n', '<Leader>fgS', ':Telescope git_stash<CR>')
map('n', '<Leader>fR', ':Telescope resume<CR>')
map('n', '<Leader>fs', ':Telescope symbols<CR>')

-- Bufferline
map('n', 'H', ':BufferLineCyclePrev<CR>')
map('n', 'L', ':BufferLineCycleNext<CR>')
map('n', '<leader><leader>', ':BufferLinePick<CR>')
map('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>')
map('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>')
map('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>')
map('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>')
map('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>')
map('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>')
map('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>')
map('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>')
map('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>')

-- CodeAction
map('n', '<leader>ca', ':CodeActionMenu<CR>')

-- Spctree: search and replace
map('n', '<leader>Ss', ':lua require("spectre").open()<CR>') -- search current word
map('n', '<leader>Sw', ':lua require("spectre").open_visual({select_word=true})<CR>')
map('v', '<leader>S', ':lua require("spectre").open_visual()<CR>') -- search in current file
map('n', '<leader>Sp', ':lua require("spectre").open_file_search()<CR>')

-- EasiAlign
map('n', 'ga', ':EasyAlign<CR>')
map('v', 'ga', ':EasyAlign<CR>')
map('x', 'ga', ':EasyAlign<CR>')

-- Markdown Preview
map('n', '<leader>tm', ':MarkdownPreviewToggle<CR>')

-- Symbols outline
map('n', '<leader>lS', '<cmd>SymbolsOutline<CR>')
