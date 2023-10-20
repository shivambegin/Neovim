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
