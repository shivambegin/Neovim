return {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
        local settings = require 'base.settings'

        vim.g.everforest_background = 'medium' -- soft, medium, hard
        vim.g.everforest_enable_italic = 1
        vim.g.everforest_dim_inactive_windows = 1
        vim.g.everforest_sign_column_background = 'grey' -- none, grey
        vim.g.everforest_spell_foreground = 'colored' -- none, colored
        vim.g.everforest_better_performance = 1
        vim.g.everforest_ui_contrast = 'high' -- low, high
        vim.g.everforest_show_eob = 1
        vim.g.everforest_diagnostic_text_highlight = 1
        vim.g.everforest_diagnostic_line_highlight = 1
        vim.g.everforest_diagnostic_virtual_text = 'colored' -- grey,colored,highlighted
        vim.g.everforest_current_word = 'bold' -- 'grey background', bold, underline, italic

        vim.g.everforest_transparent_background = settings.transparent_background
                and 1
            or 0

        vim.cmd.colorscheme 'everforest'
    end,
}
