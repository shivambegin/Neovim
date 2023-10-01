return {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,
    config = function()
        local settings = require 'base.settings'

        require('rose-pine').setup {
            --- @usage 'auto'|'main'|'moon'|'dawn'
            variant = 'auto',
            --- @usage 'main'|'moon'|'dawn'
            dark_variant = 'moon',
            bold_vert_split = false,
            dim_nc_background = false,
            disable_background = settings.transparent_background,
            disable_float_background = true,
            disable_italics = false,

            --- @usage string hex value or named color from rosepinetheme.com/palette
            groups = {
                background = 'base',
                background_nc = '_experimental_nc',
                panel = 'surface',
                panel_nc = 'base',
                border = 'highlight_med',
                comment = 'muted',
                link = 'iris',
                punctuation = 'subtle',

                error = 'love',
                hint = 'iris',
                info = 'foam',
                warn = 'gold',

                headings = {
                    h1 = 'iris',
                    h2 = 'foam',
                    h3 = 'rose',
                    h4 = 'gold',
                    h5 = 'pine',
                    h6 = 'foam',
                },
                -- or set all headings at once
                -- headings = 'subtle'
            },

            -- Change specific vim highlight groups
            -- https://github.com/rose-pine/neovim/wiki/Recipes
            highlight_groups = {
                ColorColumn = { bg = 'highlight_low' },

                -- Blend colours against the "base" background
                CursorLine = { bg = 'none', blend = 10 },
                StatusLine = { fg = 'pine', bg = 'none', blend = 10 },
                Signcolumn = { bg = 'none' },

                -- By default each group adds to the existing config.
                -- If you only want to set what is written in this config exactly,
                -- you can set the inherit option:
                Search = { bg = 'gold', inherit = false },

                TelescopeBorder = { fg = 'highlight_high', bg = 'none' },
                TelescopeNormal = { bg = 'none' },
                TelescopePromptNormal = { bg = 'base' },
                TelescopeResultsNormal = { fg = 'subtle', bg = 'none' },
                TelescopeSelection = { fg = 'text', bg = 'base' },
                TelescopeSelectionCaret = { fg = 'rose', bg = 'rose' },
                require("notify").setup({
                    background_colour = "#000000",
                  })
            },
        }

        -- Set colorscheme after options
        vim.cmd 'colorscheme rose-pine'
    end,
}
