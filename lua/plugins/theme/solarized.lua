return {
    {
        'Tsuzat/NeoSolarized.nvim',
        priority = 1000, -- make sure to load this before all the other start plugins
        lazy = false,
        config = function()
            local settings = require 'base.settings'

            require('NeoSolarized').setup {
                style = 'dark', -- "dark" or "light"
                transparent = settings.transparent_background,
                terminal_colors = true,
                enable_italics = true,
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    functions = { bold = true, italic = true },
                    variables = {},
                    string = { italic = true },
                    underline = true,
                    undercurl = true,
                },
                -- Add specific hightlight groups
                on_highlights = function(highlights, colors)
                    -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
                end,
            }

            -- vim.cmd.colorscheme 'NeoSolarized'
        end,
    },
    -- {
    --     'ishan9299/nvim-solarized-lua',
    --     lazy = false,
    --     config = function()
    --         local settings = require 'base.settings'
    --
    --         vim.g.solarized_italics = 1
    --         vim.g.solarized_visibility = 'normal' -- low, normal, high
    --         vim.g.solarized_diffmode = 'normal' -- low, normal, high
    --         vim.g.solarized_statusline = 'normal' -- low, flat, normal
    --         vim.g.solarized_termtrans = settings.transparent_background and 1
    --             or 0
    --
    --         vim.cmd.colorscheme 'solarized' -- solarized, solarized-high, solarized-flat, solarized-low
    --     end,
    -- },
}
