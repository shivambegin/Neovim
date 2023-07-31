return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'windwp/nvim-ts-autotag',
        },
        build = ':TSUpdate',
        event = 'BufReadPost',
        opts = {
            ensure_installed = {
                'awk',
                'bash',
                'comment',
                'css',
                'dockerfile',
                'embedded_template',
                'git_config',
                'git_rebase',
                'gitcommit',
                'go',
                'graphql',
                'hjson',
                'html',
                'http',
                'ini',
                'javascript',
                'jsdoc',
                'json5',
                'jsonc',
                'lua',
                'make',
                'markdown',
                'markdown_inline',
                'ocaml',
                'php',
                'phpdoc',
                'prisma',
                'pug',
                'python',
                'regex',
                'rust',
                'scss',
                'svelte',
                'todotxt',
                'toml',
                'tsx',
                'typescript',
                'vim',
                'vimdoc',
                'vue',
                'yaml',
                'yuck',
            },
            sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
            ignore_install = {}, -- List of parsers to ignore installing
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats =
                        pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = false, disable = { 'yaml' } },
            autotag = { enable = true },
            autopairs = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = false },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<CR>',
                    scope_incremental = '<CR>',
                    node_incremental = '<TAB>',
                    node_decremental = '<S-TAB>',
                },
            },
            refactor = {
                highlight_definitions = { enable = true },
                highlight_current_scope = { enable = false },
                navigation = {
                    enable = true,
                    keymaps = {
                        goto_definition = 'gnd',
                        list_definitions = 'gnD',
                        list_definitions_toc = 'gO',
                        goto_next_usage = '<a-*>',
                        goto_previous_usage = '<a-#>',
                    },
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['ak'] = {
                            query = '@block.outer',
                            desc = 'around block',
                        },
                        ['ik'] = {
                            query = '@block.inner',
                            desc = 'inside block',
                        },
                        ['ac'] = {
                            query = '@class.outer',
                            desc = 'around class',
                        },
                        ['ic'] = {
                            query = '@class.inner',
                            desc = 'inside class',
                        },
                        ['a?'] = {
                            query = '@conditional.outer',
                            desc = 'around conditional',
                        },
                        ['i?'] = {
                            query = '@conditional.inner',
                            desc = 'inside conditional',
                        },
                        ['af'] = {
                            query = '@function.outer',
                            desc = 'around function ',
                        },
                        ['if'] = {
                            query = '@function.inner',
                            desc = 'inside function ',
                        },
                        ['al'] = { query = '@loop.outer', desc = 'around loop' },
                        ['il'] = { query = '@loop.inner', desc = 'inside loop' },
                        ['aa'] = {
                            query = '@parameter.outer',
                            desc = 'around argument',
                        },
                        ['ia'] = {
                            query = '@parameter.inner',
                            desc = 'inside argument',
                        },
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        [']k'] = {
                            query = '@block.outer',
                            desc = 'Next block start',
                        },
                        [']f'] = {
                            query = '@function.outer',
                            desc = 'Next function start',
                        },
                        [']a'] = {
                            query = '@parameter.inner',
                            desc = 'Next parameter start',
                        },
                    },
                    goto_next_end = {
                        [']K'] = {
                            query = '@block.outer',
                            desc = 'Next block end',
                        },
                        [']F'] = {
                            query = '@function.outer',
                            desc = 'Next function end',
                        },
                        [']A'] = {
                            query = '@parameter.inner',
                            desc = 'Next parameter end',
                        },
                    },
                    goto_previous_start = {
                        ['[k'] = {
                            query = '@block.outer',
                            desc = 'Previous block start',
                        },
                        ['[f'] = {
                            query = '@function.outer',
                            desc = 'Previous function start',
                        },
                        ['[a'] = {
                            query = '@parameter.inner',
                            desc = 'Previous parameter start',
                        },
                    },
                    goto_previous_end = {
                        ['[K'] = {
                            query = '@block.outer',
                            desc = 'Previous block end',
                        },
                        ['[F'] = {
                            query = '@function.outer',
                            desc = 'Previous function end',
                        },
                        ['[A'] = {
                            query = '@parameter.inner',
                            desc = 'Previous parameter end',
                        },
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ['>K'] = {
                            query = '@block.outer',
                            desc = 'Swap next block',
                        },
                        ['>F'] = {
                            query = '@function.outer',
                            desc = 'Swap next function',
                        },
                        ['>A'] = {
                            query = '@parameter.inner',
                            desc = 'Swap next parameter',
                        },
                    },
                    swap_previous = {
                        ['<K'] = {
                            query = '@block.outer',
                            desc = 'Swap previous block',
                        },
                        ['<F'] = {
                            query = '@function.outer',
                            desc = 'Swap previous function',
                        },
                        ['<A'] = {
                            query = '@parameter.inner',
                            desc = 'Swap previous parameter',
                        },
                    },
                },
            },
            matchup = {
                enable = true,
                enable_quotes = true,
                disable = { 'c', 'ruby' },
            },
        },
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)
            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        end,
    },
    -- {
    --     'nvim-treesitter/nvim-treesitter-context',
    --     event = 'BufReadPost',
    --     dependencies = {
    --         'nvim-treesitter/nvim-treesitter',
    --     },
    --     opts = true,
    -- },
}
