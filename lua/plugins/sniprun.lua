return {
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh 1',
        cmd = {
            'SnipRun',
            'SnipInfo',
            'SnipReset',
            'SnipClose',
            'SnipRepl',
            'SnipLive',
        },
        config = function()
            require('sniprun').setup {
                repl_enable = { 'JS_TS_deno' },
                interpreter_options = { --# interpreter-specific options, see docs / :SnipInfo <name>
                    JS_TS_deno = {
                        use_on_filetypes = 'javascript,typescript',
                    },
                },
                live_mode_toggle = 'on',
            }
        end,
    },
}
