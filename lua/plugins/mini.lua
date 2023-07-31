return {
    {
        'echasnovski/mini.pairs',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function(_, opts)
            require('mini.pairs').setup(opts)
        end,
    },
    {
        'echasnovski/mini.bufremove',
        keys = {
            {
                '<leader>x',
                function()
                    require('mini.bufremove').delete(0, false)
                end,
                desc = 'Delete Buffer',
            },
            {
                '<leader>X',
                function()
                    require('mini.bufremove').delete(0, true)
                end,
                desc = 'Delete Buffer (Force)',
            },
        },
    },
    {
        'echasnovski/mini.align',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function(_, opts)
            require('mini.align').setup(opts)
        end,
    },
}
