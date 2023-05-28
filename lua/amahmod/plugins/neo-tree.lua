return {
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
                '<cmd>Neotree toggle<CR>',
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
}
