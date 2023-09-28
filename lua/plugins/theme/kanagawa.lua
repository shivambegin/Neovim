return {
    'rebelot/kanagawa.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        local settings = require 'base.settings'
        -- Default options:
        require('kanagawa').setup {
            compile = false, -- enable compiling the colorscheme
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = { bold = true },
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = true,
            dimInactive = true,
            terminalColors = true,
            colors = {
                palette = {},
                theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
            },
            overrides = function(colors) -- add/modify highlights
                return {}
            end,
            theme = 'dragon', -- Load "wave" theme when 'background' option is not set
            background = { -- map the value of 'background' option to a theme
                dark = 'wave', -- try "dragon" !
                light = 'lotus',
            },
        }

        -- vim.cmd 'colorscheme kanagawa-dragon'
    end,
}
