-- On MacOS, run `export CC="$(which gcc-12)"; nvim`
return {
    'nvim-neorg/neorg',
    dependencies = 'nvim-lua/plenary.nvim',
    build = ':Neorg sync-parsers', -- This is the important bit!
    event = 'VeryLazy',
    opts = {
        load = {
            ['core.defaults'] = {},
            ['core.integrations.nvim-cmp'] = {},
            ['core.completion'] = {
                config = {
                    engine = 'nvim-cmp',
                },
            },
            ['core.concealer'] = {},
            ['core.dirman'] = {
                config = {
                    workspaces = {
                        work = '~/Documents/notes/work',
                        home = '~/Documents/notes/home',
                    },
                    default_workspace = 'work',
                }
            },
            ['core.export'] = {},
        }
    },
}
