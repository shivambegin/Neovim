return {
    {
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            local settings = require 'base.settings'
            require('nightfox').setup {
                options = {
                    compile_path = vim.fn.stdpath 'cache' .. '/nightfox',
                    compile_file_suffix = '_compiled', -- Compiled file suffix
                    transparent = settings.transparent_background,
                    terminal_colors = true,
                    dim_inactive = false,
                    module_default = true,
                    styles = {
                        comments = 'italic',
                        conditionals = 'italic',
                        constants = 'bold',
                        functions = 'italic,bold',
                        keywords = 'italic',
                        numbers = 'NONE',
                        operators = 'NONE',
                        strings = 'NONE',
                        types = 'NONE',
                        variables = 'italic',
                    },
                    inverse = { -- Inverse highlight for different types
                        match_paren = true,
                        visual = false,
                        search = false,
                    },
                    modules = { -- List of various plugins and additional options
                        -- ...
                    },
                },
                specs = {},
                groups = {},
            }

            vim.cmd.colorscheme 'nordfox'
        end,
    },
}
