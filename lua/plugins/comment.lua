return {
    {
        'echasnovski/mini.comment',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            hooks = {
                pre = function()
                    require('ts_context_commentstring.internal').update_commentstring {}
                end,
            },
        },
        config = function(_, opts)
            require('mini.comment').setup(opts)
        end,
    },
    {
        'LudoPinelli/comment-box.nvim',
        cmd = {
            'CBllbox',
            'CBlcbox',
            'CBlrbox',
            'CBclbox',
            'CBccbox',
            'CBcrbox',
            'CBrlbox',
            'CBrcbox',
            'CBrrbox',
            'CBalbox',
            'CBacbox',
            'CBarbox',
        },
    },

    -- Todo comments
    {
        'folke/todo-comments.nvim',
        cmd = { 'TodoTrouble', 'TodoTelescope' },
        event = { 'BufReadPost', 'BufNewFile' },
        config = true,
    },
    {
        'xorid/asciitree.nvim',
        cmd = 'AsciiTree',
    },
}
