local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local map = vim.keymap.set

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
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
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

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

local M = {}

function M.neovim_config()
    require('telescope.builtin').find_files {
        prompt_title = ' Neovim configs',
        path_display = { 'smart' },
        cwd = '~/.config/nvim/',
        layout_strategy = 'horizontal',
        layout_config = { preview_width = 0.65, width = 0.75 },
    }
end

function M.find_notes()
    require('telescope.builtin').find_files {
        prompt_title = ' Find Notes',
        path_display = { 'smart' },
        cwd = '~/.notes/',
        layout_strategy = 'horizontal',
        layout_config = { preview_width = 0.65, width = 0.75 },
    }
end

function M.grep_notes()
    local opts = {}
    opts.hidden = true
    opts.search_dirs = { '~/.notes/' }
    opts.prompt_prefix = '    '
    opts.prompt_title = ' Grep Notes'
    opts.path_display = { 'smart' }
    require('telescope.builtin').live_grep(opts)
end

return M
