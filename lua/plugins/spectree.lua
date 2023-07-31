-- spectre.nvim [search and replace in project]
-- https://github.com/nvim-pack/nvim-spectre
-- INSTRUCTIONS:
-- To see the instructions press '?'
-- To start the search press <ESC>.
-- It doesn't have ctrl-z so please always commit before using it.

return {
    'zeioth/nvim-spectre',
    cmd = 'Spectre',
    opts = {
        find_engine = {
            default = {
                find = {
                    --pick one of item in find_engine [ag, rg ]
                    cmd = 'ag',
                    options = {},
                },
                replace = {
                    -- If you install oxi with cargo you can use it instead.
                    cmd = 'sed',
                },
            },
        },
        is_insert_mode = true, -- start open panel on is_insert_mode
        mapping = {},
    },
}
