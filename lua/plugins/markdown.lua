return {
    {
        'preservim/vim-markdown',
        ft = { 'markdown' },
    },
    -- markdown preview
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && yarn install',
        ft = { 'markdown' },
        keys = {
            {
                '<leader>tm',
                '<cmd>MarkdownPreviewToggle<CR>',
                { desc = 'toggle markdown preview', noremap = true },
            },
        },
    },
}
