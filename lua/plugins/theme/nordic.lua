return{
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require 'nordic' .load()
        local palette = require 'nordic.colors'
        local settings = require 'base.settings'
        require 'nordic' .setup {
            -- This callback can be used to override the colors used in the palette.
            on_palette = function(palette) return palette end,
            -- Enable bold keywords.
            bold_keywords = false,
            -- Enable italic comments.
            italic_comments = true,
            -- Enable general editor background transparency.
            transparent_bg = settings.transparent_background,
            -- Enable brighter float border.
            bright_border = false,
            -- Reduce the overall amount of blue in the theme (diverges from base Nord).
            reduced_blue = true,
            -- Swap the dark background with the normal one.
            swap_backgrounds = false,
            -- Override the styling of any highlight group.
            transparent = 'full',
            override = {
                TelescopePromptTitle = {
                    fg = palette.red.bright,
                    bg = palette.green.base,
                    italic = true,
                    underline = true,
                    sp = palette.yellow.dim,
                    undercurl = false
                }
            },
            -- Cursorline options.  Also includes visual/selection.
            cursorline = {
                -- Bold font in cursorline.
                bold = false,
                -- Bold cursorline number.
                bold_number = true,
                -- Avialable styles: 'dark', 'light'.
                theme = 'dark',
                -- Blending the cursorline bg with the buffer bg.
                blend = 0.7,
            },
            noice = {
                -- Available styles: `classic`, `flat`.
                style = 'classic',
            },
            telescope = {
                -- Available styles: `classic`, `flat`.
                style = 'classic',
            },
            leap = {
                -- Dims the backdrop when using leap.
                dim_backdrop = false,
            },
            ts_context = {
                -- Enables dark background for treesitter-context window
                dark_background = true,
            },
        }
        -- Set colorscheme after options
        vim.cmd 'colorscheme nordic'
    end
}
