return {
    {
        'feline-nvim/feline.nvim',
        event = 'VeryLazy',
        config = function()
            local feline = require 'feline'

            local colors = require 'plugins.feline.colors'
            local hl = require('plugins.feline.helpers').hl
            local pp = require('plugins.feline.helpers').provider
            local conditional =
                require('plugins.feline.helpers').conditional

            local theme =
                hl.group('StatusLine', { fg = colors.fg, bg = colors.bg_1 })

            theme.bg = 'NONE'

            feline.setup {
                disable = {
                    filetypes = {
                        '^NvimTree$',
                        '^neo%-tree$',
                        '^dashboard$',
                        '^Outline$',
                        '^aerial$',
                    },
                },
                theme = theme,
                components = {
                    active = {
                        {
                            { provider = pp.spacer(), hl = hl.mode() },
                            { provider = pp.spacer(2) },
                            {
                                provider = 'git_branch',
                                hl = hl.fg(
                                    'Conditional',
                                    { fg = colors.purple_1, style = 'bold' }
                                ),
                                icon = ' ',
                            },
                            {
                                provider = pp.spacer(3),
                                enabled = conditional.git_available,
                            },
                            {
                                provider = {
                                    name = 'file_type',
                                    opts = {
                                        filetype_icon = true,
                                        case = 'lowercase',
                                    },
                                },
                                enabled = conditional.has_filetype,
                            },
                            {
                                provider = pp.spacer(2),
                                enabled = conditional.has_filetype,
                            },
                            {
                                provider = 'git_diff_added',
                                hl = hl.fg(
                                    'GitSignsAdd',
                                    { fg = colors.green }
                                ),
                                icon = '  ',
                            },
                            {
                                provider = 'git_diff_changed',
                                hl = hl.fg(
                                    'GitSignsChange',
                                    { fg = colors.orange_1 }
                                ),
                                icon = ' 柳',
                            },
                            {
                                provider = 'git_diff_removed',
                                hl = hl.fg(
                                    'GitSignsDelete',
                                    { fg = colors.red_1 }
                                ),
                                icon = '  ',
                            },
                            {
                                provider = pp.spacer(2),
                                enabled = conditional.git_changed,
                            },
                            {
                                provider = 'diagnostic_errors',
                                hl = hl.fg(
                                    'DiagnosticError',
                                    { fg = colors.red_1 }
                                ),
                                icon = '  ',
                            },
                            {
                                provider = 'diagnostic_warnings',
                                hl = hl.fg(
                                    'DiagnosticWarn',
                                    { fg = colors.orange_1 }
                                ),
                                icon = '  ',
                            },
                            {
                                provider = 'diagnostic_info',
                                hl = hl.fg(
                                    'DiagnosticInfo',
                                    { fg = colors.white_2 }
                                ),
                                icon = '  ',
                            },
                            {
                                provider = 'diagnostic_hints',
                                hl = hl.fg(
                                    'DiagnosticHint',
                                    { fg = colors.yellow_1 }
                                ),
                                icon = '  ',
                            },
                        },
                        {
                            -- {
                            --     provider = provider.lsp_progress,
                            --     enabled = conditional.bar_width(),
                            -- },
                            {
                                provider = pp.lsp_client_names(true),
                                short_provider = pp.lsp_client_names(),
                                enabled = conditional.bar_width(),
                                icon = '   ',
                            },
                            {
                                provider = pp.spacer(2),
                                enabled = conditional.bar_width(),
                            },
                            {
                                provider = pp.treesitter_status,
                                enabled = conditional.bar_width(),
                                hl = hl.fg(
                                    'GitSignsAdd',
                                    { fg = colors.green }
                                ),
                            },
                            { provider = pp.spacer(2) },
                            { provider = 'position' },
                            { provider = pp.spacer(2) },
                            { provider = 'line_percentage' },
                            { provider = pp.spacer() },
                            {
                                provider = 'scroll_bar',
                                hl = hl.fg('TypeDef', { fg = colors.yellow }),
                            },
                        },
                    },
                },
            }
        end,
    },
}
