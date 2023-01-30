return {

    -- tokyonight
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = { style = 'moon' },
        config = function(_, opts)
            local tokyonight = require 'tokyonight'
            tokyonight.setup(opts)
            tokyonight.load()
        end,
    },
}
