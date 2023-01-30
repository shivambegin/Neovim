return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'nvim-treesitter/nvim-treesitter-refactor',
        },
        build = ':TSUpdate',
        event = 'BufReadPost',
        opts = {
            ensure_installed = {
                'bash',
                'comment',
                'css',
                'dockerfile',
                'embedded_template',
                'go',
                'graphql',
                'help',
                'hjson',
                'html',
                'http',
                'javascript',
                'jsdoc',
                'json5',
                'jsonc',
                'lua',
                'make',
                'markdown',
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
                'vue',
                'yaml',
            },
            sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
            ignore_install = { '' }, -- List of parsers to ignore installing
            highlight = {
                enable = true, -- false will disable the whole extension
                disable = {}, -- list of language that will be disabled
                additional_vim_regex_highlighting = true,
            },
            indent = { enable = false, disable = { 'yaml' } },
            autotag = { enable = true },
            autopairs = { enable = true },
            context_commentstring = { enable = true, enable_autocmd = true },
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
                swap = {
                    enable = true,
                    -- swap_next = { [']s'] = '@parameter.inner' },
                    -- swap_previous = { ['[s'] = '@parameter.inner' },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                        [']m'] = '@function.outer',
                        [']]'] = '@class.outer',
                        [']a'] = '@parameter.inner',
                    },
                    goto_next_end = {
                        [']M'] = '@function.outer',
                        [']['] = '@class.outer',
                        [']A'] = '@parameter.inner',
                    },
                    goto_previous_start = {
                        ['[m'] = '@function.outer',
                        ['[['] = '@class.outer',
                        ['[a'] = '@parameter.inner',
                    },
                    goto_previous_end = {
                        ['[M'] = '@function.outer',
                        ['[]'] = '@class.outer',
                        ['[A'] = '@parameter.inner',
                    },
                },
                lsp_interop = {
                    enable = true,
                    border = 'none',
                    peek_definition_code = {
                        ['<leader>df'] = '@function.outer',
                        ['<leader>dF'] = '@class.outer',
                    },
                },
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        -- You can use the capture groups defined in textobjects.scm
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
            },
            matchup = { enable = true, disable = { 'c', 'ruby' } },
        },
        ---@param opts TSConfig
        config = function(plugin, opts)
            if plugin.ensure_installed then
                require('lazyvim.util').deprecate(
                    'treesitter.ensure_installed',
                    'treesitter.opts.ensure_installed'
                )
            end
            require('nvim-treesitter.configs').setup(opts)
        end,
    },
}
