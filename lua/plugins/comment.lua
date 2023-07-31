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
        -- stylua: ignore
        keys = {
            { "]T", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
            { "[T", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
            { "<leader>st", "<cmd>TodoTelescope<cr>", desc = "Todo" },
            { "<leader>sT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
        },
    },
    {
        'xorid/asciitree.nvim',
        cmd = 'AsciiTree',
    },
}
