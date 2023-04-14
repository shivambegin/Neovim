local settings = require 'amahmod.configs.settings'
return {
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local tokyonight = require 'tokyonight'

            tokyonight.setup {
                style = 'night',
                transparent = settings.transparent_background,
            }

            vim.cmd.colorscheme 'tokyonight'
        end,
    },
}
