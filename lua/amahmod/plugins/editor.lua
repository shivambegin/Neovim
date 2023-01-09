local util = require 'amahmod.util'

return {
    -- file explorer
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
        },
        cmd = 'Neotree',
        keys = {
            {
                '<leader>e',
                ':Neotree toggle<CR>',
                desc = 'NeoTree Toggle',
            },
        },
        init = function()
            vim.g.neo_tree_remove_legacy_commands = 1
        end,
        opts = {
            filesystem = {
                follow_current_file = true,
                hijack_netrw_behavior = 'open_current',
                filtered_items = {
                    never_show = { '.git' },
                },
            },
            window = {
                position = 'right',
                width = 30,
                mappings = {
                    ['o'] = 'open',
                },
            },
        },
    },

    -- fuzzy finder
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        version = false, -- telescope did only one release, so use HEAD for now
        keys = {
            {
                '<C-p>',
                ':Telescope find_files<CR>',
                desc = 'Find Files (root dir)',
            },
            {
                '<leader>ff',
                util.telescope('files', { cwd = false }),
                desc = 'Find Files (cwd)',
            },

            {
                '<leader>fw',
                util.telescope 'live_grep',
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
            {
                '<leader>sg',
                util.telescope 'live_grep',
                desc = 'Grep (root dir)',
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
                ':Telescope search_history<cr>',
                desc = 'Search history',
            },
            {
                '<leader>ds',
                util.telescope('lsp_document_symbols', {
                    symbols = {
                        'Class',
                        'Function',
                        'Method',
                        'Constructor',
                        'Interface',
                        'Module',
                        'Struct',
                        'Trait',
                        'Field',
                        'Property',
                    },
                }),
                desc = 'Goto Symbol',
            },
        },
        opts = {
            defaults = {
                prompt_prefix = ' ',
                selection_caret = ' ',
                mappings = {
                    i = {
                        ['<c-t>'] = function(...)
                            return require('trouble.providers.telescope').open_with_trouble(
                                ...
                            )
                        end,
                        ['<C-i>'] = function()
                            util.telescope('find_files', { no_ignore = true })()
                        end,
                        ['<C-h>'] = function()
                            util.telescope('find_files', { hidden = true })()
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

    -- search/replace in multiple files
    {
        'windwp/nvim-spectre',
        -- stylua: ignore
        keys = {
            { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
        },
    },

    -- easily jump to any location and enhanced f/t motions for Leap
    {
        'ggandor/leap.nvim',
        event = 'VeryLazy',
        dependencies = {
            { 'ggandor/flit.nvim', opts = { labeled_modes = 'nv' } },
        },
        config = function(_, opts)
            local leap = require 'leap'
            for k, v in pairs(opts) do
                leap.opts[k] = v
            end
            leap.add_default_mappings()
        end,
    },

    {
        'tpope/vim-fugitive',
        cmd = {
            'G',
            'Git',
            'Gdiff',
            'Gclog',
            'Ggrep',
            'Gread',
            'Gwrite',
            'GDelete',
            'GBrowser',
            'Gdiffsplit',
            'Gvdiffsplit',
            'Gfetch',
            'Gfetch',
        },
        keys = {
            { '<leader>gg', ':Git<cr>', desc = 'Git status' },
        },
    },

    -- git signs
    {
        'lewis6991/gitsigns.nvim',
        event = 'BufReadPre',
        opts = {
            signs = {
                add = { text = '▎' },
                change = { text = '▎' },
                delete = { text = '契' },
                topdelete = { text = '契' },
                changedelete = { text = '▎' },
                untracked = { text = '▎' },
            },
            on_attach = function(buffer)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, desc)
                    vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
                end

                -- stylua: ignore start
                map("n", "]h", gs.next_hunk, "Next Hunk")
                map("n", "[h", gs.prev_hunk, "Prev Hunk")
                map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
                map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
                map("n", "<leader>ghS", gs.stage_buffer, "Stage Buffer")
                map("n", "<leader>ghu", gs.undo_stage_hunk, "Undo Stage Hunk")
                map("n", "<leader>ghR", gs.reset_buffer, "Reset Buffer")
                map("n", "<leader>ghp", gs.preview_hunk, "Preview Hunk")
                map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame Line")
                map("n", "<leader>ghd", gs.diffthis, "Diff This")
                map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff This ~")
                map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
            end,
        },
    },

    -- buffer remove
    {
        'echasnovski/mini.bufremove',
        -- stylua: ignore
        keys = {
            { "<leader>x", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
            { "<leader>X", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
        },
    },

    -- todo comments
    {
        'folke/todo-comments.nvim',
        cmd = { 'TodoTrouble', 'TodoTelescope' },
        event = 'BufReadPost',
        config = true,
        -- stylua: ignore
        keys = {
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
            { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
        },
    },
}
