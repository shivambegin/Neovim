local map = vim.keymap.set

-- ==========================================================================
-- ================================ GENERAL =================================
-- ==========================================================================

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map('n', 'n', 'nzzzv') -- keep the cursor centered when doing 'n'
map('n', 'N', 'Nzzzv') -- keep the cursor centered when doing 'N'
map('n', 'J', 'mzJ`z', { desc = 'Join line without moving the cursor' })
map('n', 'cn', '*``cgn', { desc = 'Change next match by pressing dot (.)' })
map('n', 'cN', '*``cgN', { desc = 'Change previous match by pressing dot (.)' })
map('n', '<leader>vp', '`[v`]<CR>', { desc = 'Select pasted text' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })
map(
    'n',
    '<leader>z',
    ':%s/<C-R><C-W>/<C-R>0/g<CR>',
    { desc = 'Replace word under cursor with register "0" content globally' }
)

map('n', '<leader>ts', ':set spell!<CR>', { desc = 'Toggle spell check' })
map(
    'n',
    '<leader>th',
    ':set hlsearch!<CR>',
    { desc = 'Toggle highlights (hlsearch)' }
)
map(
    'n',
    '<leader>tq',
    ':lua require("amahmod.core.utils").toggle_qf()<CR>',
    { desc = 'Toggle quickfix list' }
)

map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })

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
map('n', '<leader>s', '<cmd>w<CR>', { desc = 'Save buffer' })
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
map('n', '<C-S-j>', ':cnext<CR>', { desc = 'Next quickfix item' })
map('n', '<C-S-k>', ':cprev<CR>', { desc = 'previous quickfix item' })

map('n', '<leader>S', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')
map('v', '<leader>S', ':s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>')

-- LocationList
map('n', '<Leader>lo', ':lopen<CR>', { desc = 'Open location list' })
map('n', '<Leader>lc', ':lclose<CR>', { desc = 'Close location list' })
map('n', '<Leader>ln', ':lnext<CR>', { desc = 'Next location list item' })
map('n', '<Leader>lp', ':lprev<CR>', { desc = 'Previous location list item' })

-- ===========================================================================
-- ================================= PLUGINS =================================
-- ===========================================================================

-- Nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>')

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

-- UndoTree
map('n', '<leader>U', ':UndotreeToggle<CR>', { desc = 'Toggle undo tree' })

-- vim-doge
map(
    'n',
    '<leader>dg',
    ':DogeGenerate<Cr>',
    { desc = 'Generate documentation for code' }
)

-- Telescope
map('n', '<leader>H', ':Telescope help_tags<CR>', { desc = 'help tags' })
map('n', '<C-P>', ':Telescope find_files<Cr>', { desc = 'Find files' })
map(
    'n',
    '<leader>fw',
    ':Telescope live_grep<CR>',
    { desc = 'Live grep (Telescope)' }
)
map('n', '<leader>fW', function()
    require('telescope.builtin').grep_string { search = vim.fn.expand '<cword>' }
end, { desc = 'Grep string (Telescope)' })
map('n', '<leader>ff', ':Telescope buffers<CR>', { desc = 'Buffer list' })
map(
    'n',
    '<Leader>fl',
    ':Telescope current_buffer_fuzzy_find<CR>',
    { desc = 'Find  in current buffer' }
)
map('n', '<leader>fo', ':Telescope oldfiles<CR>', { desc = 'Find old files' })
map(
    'n',
    '<leader>ls',
    ':Telescope lsp_document_symbols<CR>',
    { desc = 'LSP document symbols' }
)
map(
    'n',
    '<leader>ld',
    ':Telescope diagnostics<CR>',
    { desc = 'Workspace diagnostics' }
)
map('n', '<Leader>fr', ':Telescope resume<CR>', { desc = 'Resume last search' })
map(
    'n',
    '<leader>:',
    ':Telescope command_history<CR>',
    { desc = 'Find command history' }
)
map(
    'n',
    '<leader>/',
    ':Telescope search_history<CR>',
    { desc = 'Find search history' }
)
map('n', '<leader>fc', ':Telescope commands<CR>', { desc = 'Find commands' })
map('n', '<leader>fh', ':Telescope help_tags<CR>', { desc = 'Find help tags' })
map('n', '<leader>fk', ':Telescope keymaps<CR>', { desc = 'Find key mappings' })
map(
    'n',
    '<leader>fn',
    ':lua require("amahmod.configs.telescope").find_notes()<CR>',
    { desc = 'Find personal notes' }
)

-- Telescope Git
map('n', '<leader>gs', ':Telescope git_status<CR>', { desc = 'Git status' })
map('n', '<leader>gb', ':Telescope git_branches<CR>', { desc = 'Git branches' })
map('n', '<leader>gc', ':Telescope git_commits<CR>', { desc = 'Git commits' })
map('n', '<leader>gp', ':Telescope git_bcommits<CR>', { desc = 'Git bcommits' })

-- Git (fugitive)
map('n', '<leader>gg', ':Git<CR>', { desc = 'Open git (fugitive)' })
