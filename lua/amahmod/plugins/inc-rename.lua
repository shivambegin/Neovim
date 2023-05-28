return {
    {
        'smjonas/inc-rename.nvim',
        event = 'BufReadPre',
        config = function()
            require('inc_rename').setup {
                input_buffer_type = 'dressing',
            }
        end,
    },
}
