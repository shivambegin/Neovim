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
map('n', '<leader>vp', '`[v`]<CR>', { desc = 'Select pasted text' })
-- map('v', '<leader>p', '"_dP') -- delete into black hole and past last yank
map('n', '<leader>Y', 'gg"+yG', { desc = 'Copy whole buffer' })
map('n', '<leader>V', 'ggVG', { desc = 'Select whole buffer' })
-- map('n', '<leader>D', 'gg"_dG') -- delete into black hole register
-- map('v', '<leader>D', '"_d') -- delete into black hole register
map('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })
map(
  'n',
  '<leader>z',
  ':%s/<C-R><C-W>/<C-R>0/g<CR>',
  { desc = 'Replace word under cursor with register "0" content globally' }
)
map('n', '<leader>h', '<cmd>nohlsearch<CR>', { desc = 'Hide highlights' })

-- Better window management
map('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
map('n', '<C-j>', '<C-w>j', { desc = 'Move to below split' })
map('n', '<C-k>', '<C-w>k', { desc = 'Move to above split' })
map('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })
map('n', '<C-Up>', '<cmd>resize -2<CR>', { desc = 'Resize split up' })
map('n', '<C-Down>', '<cmd>resize +2<CR>', { desc = 'Resize split down' })
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Resize split left' })
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Resize split right' })

-- save and quit
map('n', '<C-s>', '<cmd>w!<CR>', { desc = 'Force save' })
map('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save buffer' })
map('n', '<leader>q', '<cmd>q!<CR>', { desc = 'Force quit' })
map('n', '<leader>Q', '<cmd>wq!<CR>', { desc = 'Force save and  quit' })

-- Buffers
map('n', '<leader>ba', ':bufdo bd<CR>', { desc = 'close all buffers' })
map('n', '<leader>bo', ':w <bar> %bd <bar> e# <bar> bd#<CR>', { desc = 'Close all buffers except current one' })
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
map('n', '<A-q>', ':lua require("utils").toggle_qf()<CR>', { desc = 'Toggle quickfix list' })
-- remap("n", "<A-o>", ":copen<CR>") -- open quickfix
map('n', '<A-j>', ':cnext<CR>', { desc = 'Next quickfix item' })
map('n', '<A-k>', ':cprev<CR>', { desc = 'previous quickfix item' })

-- LocationList
map('n', '<Leader>lo', ':lopen<CR>', { desc = 'Open location list' })
map('n', '<Leader>lc', ':lclose<CR>', { desc = 'Close location list' })
map('n', '<Leader>ln', ':lnext<CR>', { desc = 'Next location list item' })
map('n', '<Leader>lp', ':lprev<CR>', { desc = 'Previous location list item' })

-------------------------------------------------------------------------
--                               PLUGINS
-------------------------------------------------------------------------

-- Packer
map('n', '<leader>pc', '<cmd>PackerCompile<cr>', { desc = 'Packer compile' })
map('n', '<leader>pi', '<cmd>PackerInstall<cr>', { desc = 'Install packer plugins' })
map('n', '<leader>ps', '<cmd>PackerSync<cr>', { desc = 'Sync packer plugins' })
map('n', '<leader>pS', '<cmd>PackerStatus<cr>', { desc = 'Packer status' })
map('n', '<leader>pu', '<cmd>PackerUpdate<cr>', { desc = 'Update packer plugins' })

-- Nvim-tree
map('n', '<leader>e', ':NvimTreeToggle<CR>')

-- bufdelete.nvim
map('n', '<leader>c', '<cmd>Bdelete!<CR>', { desc = 'Close buffer (vim-bbye)' })

-- Telescope
map('n', '<C-p>', ':Telescope find_files<CR>', { desc = 'Find files (Telescope)' })
map('n', '<leader>fg', ':Telescope git_files<CR>', { desc = 'Find git files (Telescope)' })
map('n', '<leader>fw', ':Telescope live_grep<CR>', { desc = 'Live grep (Telescope)' })
map('n', '<leader>gt', ':Telescope git_status<CR>', { desc = 'Git status (Telescope)' })
map('n', '<leader>gb', ':Telescope git_branches<CR>', { desc = 'Git branches (Telescope)' })
map('n', '<leader>gc', ':Telescope git_commits<CR>', { desc = 'Git commits (Telescope)' })
map('n', '<Leader>ff', ':Telescope current_buffer_fuzzy_find<CR>', { desc = 'Find  in current buffer' })
-- map('n', '<leader>ff', ':Telescope ', {desc = 'Find files (Telescope)'})
map('n', '<leader>fb', ':Telescope buffers<CR>', { desc = 'Buffer list' })
map('n', '<leader>fh', ':Telescope tags<CR>', { desc = 'Help tags' })
map('n', '<leader>fm', ':Telescope marks<CR>', { desc = 'Find marks' })
map('n', '<leader>fo', ':Telescope oldfiles<CR>', { desc = 'Find old files' })
-- map('n', '<leader>sb', ':Telescope ', {desc = 'Find git branches'})
map('n', '<leader>sh', ':Telescope help_tags<CR>', { desc = 'Help tags' })
map('n', '<leader>sm', ':Telescope man_pages<CR>', { desc = 'Man pages' })
map('n', '<leader>sn', function()
  require('telescope').extensions.notify.notify()
end, { desc = 'Notification list' })
map('n', '<leader>sr', ':Telescope registers<CR>', { desc = 'Find registers' })
map('n', '<leader>sk', ':Telescope keymaps<CR>', { desc = 'Find key maps' })
map('n', '<leader>sc', ':Telescope commands<CR>', { desc = 'Find commands' })
map('n', '<leader>ls', ':Telescope lsp_document_symbols<CR>', { desc = 'LSP document symbols' })
map('n', '<leader>lR', ':Telescope lsp_references<CR>', { desc = 'LSP references' })
map('n', '<leader>lD', ':Telescope diagnostics<CR>', { desc = 'Workspace diagnostics' })
map('n', '<Leader>fR', ':Telescope resume<CR>', { desc = 'Resume last search' })
map('n', '<leader>:', ':Telescope command_history<CR>', { desc = 'Find command history' })
map('n', '<leader>/', ':Telescope search_history<CR>', { desc = 'Find search history' })
map('n', '<leader>is', ':Telescope symbols<CR>', { desc = 'Insert symbols' })
map('n', '<leader>fn', function()
  require('configs.telescope').find_notes()
end, { desc = 'Find notes' })
map('n', '<leader>fN', function()
  require('configs.telescope').grep_notes()
end, { desc = 'Search in notes' })
map('n', '<leader>on', function()
  require('configs.telescope').edit_neovim()
end, { desc = 'Edit neovim config' })

-- Comment
map('n', '<C-/>', function()
  require('Comment.api').toggle_current_linewise()
end, { desc = 'Comment/uncomment code' })
map(
  'v',
  '<C-/>',
  "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
  { desc = 'Comment/uncomment in visual mode' }
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
map('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = 'Open floating terminal' })
map(
  'n',
  '<leader>th',
  '<cmd>ToggleTerm size=10 direction=horizontal<cr>',
  { desc = 'Open terminal in horizontal pane' }
)
map('n', '<leader>tv', '<cmd>ToggleTerm size=80 direction=vertical<cr>', { desc = 'Open terminal in vertical pane' })

-- Git (fugitive)
map('n', '<leader>gg', ':Git<CR>', { desc = 'Open git (fugitive)' })

-- GitSigns
map('n', ']h', function()
  require('gitsigns').next_hunk()
end, { desc = 'Go to next git hunk' })
map('n', '[h', function()
  require('gitsigns').prev_hunk()
end, { desc = 'Go to previous git hunk' })
map('n', '<leader>gl', function()
  require('gitsigns').blame_line()
end, { desc = 'Git blame line' })
map('n', '<leader>gp', function()
  require('gitsigns').preview_hunk()
end, { desc = 'Git preview hunk' })
map('n', '<leader>gh', function()
  require('gitsigns').reset_hunk()
end, { desc = 'Git reset hunk' })
map('n', '<leader>gr', function()
  require('gitsigns').reset_buffer()
end, { desc = 'Git reset buffer' })
map('n', '<leader>gs', function()
  require('gitsigns').stage_hunk()
end, { desc = 'Git stage hunk' })
map('n', '<leader>gu', function()
  require('gitsigns').undo_stage_hunk()
end, { desc = 'Git undow staged hunk' })
map('n', '<leader>gd', function()
  require('gitsigns').diffthis()
end, { desc = 'Git diff current buffer' })

-- EasiAlign
map('n', 'ga', ':EasyAlign<CR>', { desc = 'Align text  (EasiAlign normal mode)' })
map('v', 'ga', ':EasyAlign<CR>', { desc = 'Align text  (EasyAlign visual mode)' })
map('x', 'ga', ':EasyAlign<CR>', { desc = 'Align text (EasiAlign pending mode)' })

-- Markdown Preview
map('n', '<leader>tm', ':MarkdownPreviewToggle<CR>', { desc = 'Open/Toggle markdown preview' })

-- Rust tools

map('n', '<leader>rh', ':RustToggleInlayHints<CR>', { desc = 'Toggle inlay hinsts (Rust)' })
map('n', '<leader>rr', ':RustRun<CR>', { desc = 'Run Code (Rust)' })
map('n', '<leader>R', ':RustRunnables<CR>', { desc = 'Open runables popup (Rust)' })
map('n', '<leader>rm', ':RustExpandMacro<CR>', { desc = 'Expand macro (Rust)' })
map('n', '<leader>rp', ':RustParentModule<CR>', { desc = 'Go to parent macor (rust)' })
map('n', '<leader>rd', ':RustDebuggables<CR>', { desc = 'Open debuggables (Rust)' })

-- Harpoon
map('n', '<leader>hf', ':lua require("harpoon.mark").add_file()<CR>', { desc = 'Add file to harpoon' })
map('n', '<leader>hu', ':lua require("harpoon.ui").toggle_quick_menu()', { desc = 'Toggle harpoon quick menu' })
map('n', '<M-l>', ':lua require("harpoon.ui").nav_next()<CR>', { desc = 'Next harpoon mark' })
map('n', '<M-h>', ':lua require("harpoon.ui").nav_prev()<CR>', { desc = 'Preivous Harpoon mark' })

for i = 1, 5 do
  map('n', '<leader>' .. i, function()
    return require('harpoon.ui').nav_file(i)
  end)
end

function _G.set_terminal_keymaps()
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], {})
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], {})
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], {})
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], {})
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], {})
  -- vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], {})
end

augroup('TermMappings', {})
cmd('TermOpen', { desc = 'Set terminal keymaps', group = 'TermMappings', callback = _G.set_terminal_keymaps })
