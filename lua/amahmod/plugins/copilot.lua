return {
    {
        'zbirenbaum/copilot.lua',
        event = 'InsertEnter',
        enabled = false,
        opts = {
            panel = {
                enabled = true,
                auto_refresh = true,
                keymap = {
                    jump_prev = '[[',
                    jump_next = ']]',
                    accept = '<CR>',
                    refresh = 'gr',
                    open = '<M-CR>',
                },
            },
            suggestion = {
                enabled = true,
                auto_trigger = true,
                debounce = 75,
                keymap = {
                    accept = '<C-j>',
                    next = '<M-]>',
                    prev = '<M-[>',
                    dismiss = '<C-]>',
                },
            },
            filetypes = {
                markdown = true,
                gitcommit = true,
            },
        },
        config = function(_, opts)
            local copilot = require 'copilot'
            copilot.setup(opts)
        end,
    },
}
