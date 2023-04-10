return {
    {
        'norcalli/nvim-colorizer.lua',
        event = 'BufReadPost',
        config = function()
            require('colorizer').setup()
        end,
    },
    {
        'nvim-colortils/colortils.nvim',
        cmd = 'Colortils',
        config = function()
            require('colortils').setup {}
        end,
    },
}
