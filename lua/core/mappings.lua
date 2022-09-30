local map = vim.keymap.set
local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local utils = require 'core.utils'

-- ==========================================================================
-- ================================ GENERAL =================================
-- ==========================================================================

map('n', '<leader>ts', ':set spell!<CR>') -- Toggle spell check
map('n', 'n', 'nzzzv') -- keep the cursor centered when doing 'n'
map('n', 'N', 'Nzzzv') -- keep the cursor centered when doing 'N'
map('n', 'J', 'mzJ`z') -- keep the cursor in same position when joining lines
map('n', 'cn', '*``cgn') -- change next match by pressing dot (.)
map('n', 'cN', '*``cgN') -- change previous match by pressing dot (.)
map('n', '<leader>vp', '`[v`]<CR>', { desc = 'Select pasted text' })
map('v', '<leader>p', '"_dP') -- delete into black hole and past last yank
map('n', '<leader>Y', 'gg"+yG', { desc = 'Copy whole buffer' })
map('n', '<leader>V', 'ggVG', { desc = 'Select whole buffer' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })
map(
    'n',
    '<leader>z',
    ':%s/<C-R><C-W>/<C-R>0/g<CR>',
    { desc = 'Replace word under cursor with register "0" content globally' }
)
map('n', '<leader>h', '<cmd>nohlsearch<CR>', { desc = 'Hide highlights' })

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

-- Better window management
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to below split' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to above split' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })
map('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Resize split up' })
map('n', '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Resize split down' })
map(
    'n',
    '<C-Left>',
    '<cmd>vertical resize -2<CR>',
    { desc = 'Resize split left' }
)
map(
    'n',
    '<C-Right>',
    '<cmd>vertical resize +2<CR>',
    { desc = 'Resize split right' }
)

-- save and quit
map('n', '<C-s>', '<cmd>w!<CR>', { desc = 'Force save' })
map('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save buffer' })
map('n', '<leader>q', '<cmd>q!<CR>', { desc = 'Force quit' })
map('n', '<leader>Q', '<cmd>wq!<CR>', { desc = 'Force save and  quit' })

-- Buffers
map('n', '<leader>ba', ':bufdo bd<CR>', { desc = 'close all buffers' })
map(
    'n',
    '<leader>bo',
    ':w <bar> %bd <bar> e# <bar> bd#<CR>',
    { desc = 'Close all buffers except current one' }
)
map('n', '<leader>q', '<cmd>q!<CR>', { desc = 'Close buffer/window' })
map('n', '<S-l>', ':bnext<CR>', { desc = 'Go to next buffer' })
map('n', '<S-h>', ':bprevious<CR>', { desc = 'Go to previous buffer' })

-- Visual --
-- Stay in indent mode
map('v', '<', '<gv', { desc = '(V) Indent to left' })
map('v', '>', '>gv', { desc = '(V) Indent to right' })
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = '(V) Move selection up' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = '(V) Move selection down' })

-- Quickfix
map(
    'n',
    '<A-q>',
    ':lua require("utils").toggle_qf()<CR>',
    { desc = 'Toggle quickfix list' }
)
-- remap("n", "<A-o>", ":copen<CR>") -- open quickfix
map('n', '<A-j>', ':cnext<CR>', { desc = 'Next quickfix item' })
map('n', '<A-k>', ':cprev<CR>', { desc = 'previous quickfix item' })

-- LocationList
map('n', '<Leader>lo', ':lopen<CR>', { desc = 'Open location list' })
map('n', '<Leader>lc', ':lclose<CR>', { desc = 'Close location list' })
map('n', '<Leader>ln', ':lnext<CR>', { desc = 'Next location list item' })
map('n', '<Leader>lp', ':lprev<CR>', { desc = 'Previous location list item' })

-- ===========================================================================
-- ================================= PLUGINS =================================
-- ===========================================================================

-- Packer
map('n', '<leader>pc', '<cmd>PackerCompile<cr>', { desc = 'Packer compile' })
map(
    'n',
    '<leader>pi',
    '<cmd>PackerInstall<cr>',
    { desc = 'Install packer plugins' }
)
map('n', '<leader>ps', '<cmd>PackerSync<cr>', { desc = 'Sync packer plugins' })
map('n', '<leader>pS', '<cmd>PackerStatus<cr>', { desc = 'Packer status' })
map(
    'n',
    '<leader>pu',
    '<cmd>PackerUpdate<cr>',
    { desc = 'Update packer plugins' }
)

-- Nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- Git (fugitive)
map('n', '<leader>gg', ':Git<CR>', { desc = 'Open git (fugitive)' })

-- GitSigns
map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
map('n', ']c', ':Gitsigns next_hunk<CR>', { desc = 'Go to next git hunk' })
map('n', '[c', ':Gitsigns prev_hunk<CR>', { desc = 'Go to previous git hunk' })
map(
    { 'n', 'v' },
    '<leader>hs',
    ':Gitsigns stage_hunk<CR>',
    { desc = 'Git stage hunk' }
)
map(
    { 'n', 'v' },
    '<leader>hS',
    ':Gitsigns stage_buffer<CR>',
    { desc = 'Git stage buffer' }
)
map(
    { 'n', 'v' },
    '<leader>hr',
    ':Gitsigns reset_hunk<CR>',
    { desc = 'Git reset hunk' }
)
map(
    { 'n', 'v' },
    '<leader>hR',
    ':Gitsigns reset_buffer<CR>',
    { desc = 'Git reset buffer' }
)
map(
    'n',
    '<leader>hp',
    ':Gitsigns preview_hunk<CR>',
    { desc = 'Git preview hunk' }
)
map(
    'n',
    '<leader>hb',
    ':Gitsigns blame_line {full = true}<CR>',
    { desc = 'Git blame line' }
)
map(
    'n',
    '<leader>hu',
    ':Gitsigns undo_stage_hunk<CR>',
    { desc = 'Git undow staged hunk' }
)
map(
    'n',
    '<leader>hd',
    ':Gitsigns diffthis<CR>',
    { desc = 'Git diff current buffer' }
)
map(
    'n',
    '<leader>hD',
    ':Gitsigns diffthis "~"<CR>',
    { desc = 'Git diff current buffer' }
)

-- Markdown Preview
map(
    'n',
    '<leader>tm',
    ':MarkdownPreviewToggle<CR>',
    { desc = 'Open/Toggle markdown preview' }
)

-- Rust tools
map(
    'n',
    '<leader>rh',
    ':RustToggleInlayHints<CR>',
    { desc = 'Toggle inlay hinsts (Rust)' }
)
map('n', '<leader>rr', ':RustRun<CR>', { desc = 'Run Code (Rust)' })
map(
    'n',
    '<leader>R',
    ':RustRunnables<CR>',
    { desc = 'Open runables popup (Rust)' }
)
map('n', '<leader>rm', ':RustExpandMacro<CR>', { desc = 'Expand macro (Rust)' })
map(
    'n',
    '<leader>rp',
    ':RustParentModule<CR>',
    { desc = 'Go to parent macor (rust)' }
)
map(
    'n',
    '<leader>rd',
    ':RustDebuggables<CR>',
    { desc = 'Open debuggables (Rust)' }
)

-- Harpoon
map(
    'n',
    '<leader>a',
    ':lua require("harpoon.mark").add_file()<CR>',
    { desc = 'Add file to harpoon' }
)
map(
    'n',
    '<leader>u',
    ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
    { desc = 'Toggle harpoon quick menu' }
)

for i = 1, 5 do
    map('n', '<leader>' .. i, function()
        return require('harpoon.ui').nav_file(i)
    end)
end

-- vim-doge
map(
    'n',
    '<leader>dg',
    ':DogeGenerate<Cr>',
    { desc = 'Generate documentation for code' }
)

-- Terminal
map('n', '<C-\\>', '<cmd>ToggleTerm<CR>', { desc = 'Toggle terminal' })
map('n', '<leader>tn', function()
    utils.toggle_term_cmd 'node'
end, { desc = 'Open node in terminal' })
map('n', '<leader>tu', function()
    utils.toggle_term_cmd 'ncdu'
end, { desc = 'Open ncdu in terminal' })
map('n', '<leader>tt', function()
    utils.toggle_term_cmd 'htop'
end, { desc = 'Open htop in terminal' })
map('n', '<leader>tp', function()
    utils.toggle_term_cmd 'python'
end, { desc = 'Open python in terminal' })
map('n', '<leader>tl', function()
    utils.toggle_term_cmd 'lazygit'
end, { desc = 'Open lazygit in terminal' })
map(
    'n',
    '<leader>tf',
    '<cmd>ToggleTerm direction=float<cr>',
    { desc = 'Open floating terminal' }
)
map(
    'n',
    '<leader>th',
    '<cmd>ToggleTerm size=10 direction=horizontal<cr>',
    { desc = 'Open terminal in horizontal pane' }
)
map(
    'n',
    '<leader>tv',
    '<cmd>ToggleTerm size=80 direction=vertical<cr>',
    { desc = 'Open terminal in vertical pane' }
)

function _G.set_terminal_keymaps()
    -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], {})
    -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], {})
    -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], {})
    -- vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], {})
    -- vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], {})
    -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], {})
end

augroup('TermMappings', {})
cmd(
    'TermOpen',
    {
        desc = 'Set terminal keymaps',
        group = 'TermMappings',
        callback = _G.set_terminal_keymaps,
    }
)
