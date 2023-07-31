local icons = require 'base.icons'

return {
    {
        'nvim-telescope/telescope.nvim',
        version = false, -- telescope did only one release, so use HEAD for now
        dependencies = {
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'nvim-telescope/telescope-file-browser.nvim',
        },
        cmd = 'Telescope',
        keys = {
            {
                '<C-p>',
                '<cmd>Telescope find_files<CR>',
                desc = 'Find Files (root dir)',
            },
            {
                '<leader>fw',
                '<cmd>Telescope live_grep<CR>',
                desc = 'Find in Files (Grep)',
            },

            { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
            { '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Recent' },
            {
                '<leader>gc',
                '<cmd>Telescope git_commits<CR>',
                desc = 'commits',
            },
            { '<leader>gs', '<cmd>Telescope git_status<CR>', desc = 'status' },
            {
                '<leader>ha',
                '<cmd>Telescope autocommands<cr>',
                desc = 'Auto Commands',
            },
            { '<leader>hc', '<cmd>Telescope commands<cr>', desc = 'Commands' },
            {
                '<leader>hf',
                '<cmd>Telescope filetypes<cr>',
                desc = 'File Types',
            },
            {
                '<leader>hh',
                '<cmd>Telescope help_tags<cr>',
                desc = 'Help Pages',
            },
            { '<leader>hk', '<cmd>Telescope keymaps<cr>', desc = 'Key Maps' },
            {
                '<leader>hm',
                '<cmd>Telescope man_pages<cr>',
                desc = 'Man Pages',
            },
            { '<leader>ht', '<cmd>Telescope builtin<cr>', desc = 'Telescope' },
            {
                '<leader>sb',
                '<cmd>Telescope current_buffer_fuzzy_find<cr>',
                desc = 'Buffer',
            },
            {
                '<leader>sc',
                '<cmd>Telescope command_history<cr>',
                desc = 'Command History',
            },
            { '<leader>fm', '<cmd>Telescope marks<cr>', desc = 'Jump to Mark' },
            {
                '<leader>,',
                '<cmd>Telescope buffers show_all_buffers=true<cr>',
                desc = 'Switch Buffer',
            },
            {
                '<leader>:',
                '<cmd>Telescope command_history<cr>',
                desc = 'Command History',
            },
            {
                '<leader>/',
                '<cmd>Telescope search_history<cr>',
                desc = 'Search history',
            },
            {
                '<leader>ds',
                function()
                    require('telescope.builtin').lsp_document_symbols {}
                end,
                desc = 'Document symbols',
            },
            {
                '<leader>dS',
                function()
                    require('telescope.builtin').lsp_workspace_symbols {}
                end,
                desc = 'Workspace symbols',
            },
            {
                '<leader>fr',
                '<cmd>Telescope resume<cr>',
                desc = 'Resume last search',
            },
        },
        opts = {
            defaults = {
                prompt_prefix = icons.ui.Telescope .. ' ',
                selection_caret = icons.ui.Forward .. ' ',
                mappings = {
                    i = {
                        ['<c-t>'] = function(...)
                            return require('trouble.providers.telescope').open_with_trouble(
                                ...
                            )
                        end,
                        ['<C-i>'] = function()
                            return require('telescope.builtin').find_files {
                                no_ignore = true,
                            }
                        end,
                        ['<C-h>'] = function()
                            return require('telescope.builtin').find_files {
                                hidden = true,
                            }
                        end,
                        ['<C-Down>'] = function(...)
                            return require('telescope.actions').cycle_history_next(
                                ...
                            )
                        end,
                        ['<C-Up>'] = function(...)
                            return require('telescope.actions').cycle_history_prev(
                                ...
                            )
                        end,
                    },
                },
            },
        },
    },
}
