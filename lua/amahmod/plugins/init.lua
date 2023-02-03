return {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons',
    {
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
        opts = {
            input = { relative = 'cursor' },
            select = {
                backend = { 'telescope', 'fzf', 'builtin', 'nui' },
            },
        },
    },
}
