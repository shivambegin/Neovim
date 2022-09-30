local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local finders = require 'telescope.builtin'

local notify_present, _ = pcall(require, 'notify')
if notify_present then
    telescope.load_extension 'notify'
end

telescope.setup {
    defaults = {
        prompt_prefix = ' ',
        selection_caret = '❯ ',
        path_display = { 'truncate' },
        selection_strategy = 'reset',
        sorting_strategy = 'ascending',
        layout_strategy = 'horizontal',
        layout_config = {
            horizontal = {
                prompt_position = 'top',
                preview_width = 0.55,
                results_width = 0.8,
            },
            vertical = { mirror = false },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
    },
    pickers = {
        help_tags = {
            preview = true,
            layout_config = { height = 0.8, width = 0.8 },
        },
    },
    extensions = {
        ['ui-select'] = { require('telescope.themes').get_dropdown {} },
        fzf = {
            fuzzy = true,
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- "smart_case" | "ignore_case" | "respect_case"
        },
    },
}

local edit_neovim = function()
    require('telescope.builtin').find_files {
        prompt_title = ' Neovim configs',
        path_display = { 'smart' },
        cwd = '~/.config/nvim/',
        layout_strategy = 'horizontal',
        layout_config = { preview_width = 0.65, width = 0.75 },
    }
end

local find_notes = function()
    require('telescope.builtin').find_files {
        prompt_title = ' Find Notes',
        path_display = { 'smart' },
        cwd = '~/Dropbox/notes/',
        layout_strategy = 'horizontal',
        layout_config = { preview_width = 0.65, width = 0.75 },
    }
end

local grep_notes = function()
    local opts = {}
    opts.hidden = true
    opts.search_dirs = { '~/Dropbox/notes/' }
    opts.prompt_prefix = '   '
    opts.prompt_title = ' Grep Notes'
    opts.path_display = { 'smart' }
    require('telescope.builtin').live_grep(opts)
end

local Telescope = setmetatable({}, {
    __index = function(_, k)
        if vim.bo.filetype == 'NvimTree' then
            vim.cmd.wincmd 'l'
        end
        return finders[k]
    end,
})

local map = vim.keymap.set

map('n', '<leader>H', Telescope.help_tags)
map('n', '<C-P>', function()
    local ok = pcall(Telescope.git_files, { show_untracked = true })
    if not ok then
        Telescope.find_files()
    end
end)

map(
    'n',
    '<leader>fw',
    ':Telescope live_grep<CR>',
    { desc = 'Live grep (Telescope)' }
)
map(
    'n',
    '<leader>fs',
    ':Telescope git_status<CR>',
    { desc = 'Git status (Telescope)' }
)
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
