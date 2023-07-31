return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'b0o/SchemaStore.nvim',
        },
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {
            servers = {
                html = {},
                emmet_ls = {},
                rust_analyzer = {
                    settings = {
                        diagnostics = {
                            enable = true,
                        },
                    },
                },
                denols = {},
                yamlls = {},
                dockerls = {},
                -- tsserver = {
                --     settings = {
                --         typescript = {
                --             inlayHints = {
                --                 includeInlayParameterNameHints = 'all',
                --                 includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                --                 includeInlayFunctionParameterTypeHints = true,
                --                 includeInlayVariableTypeHints = true,
                --                 includeInlayPropertyDeclarationTypeHints = true,
                --                 includeInlayFunctionLikeReturnTypeHints = true,
                --                 includeInlayEnumMemberValueHints = true,
                --             },
                --         },
                --         javascript = {
                --             inlayHints = {
                --                 includeInlayParameterNameHints = 'all',
                --                 includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                --                 includeInlayFunctionParameterTypeHints = true,
                --                 includeInlayVariableTypeHints = true,
                --                 includeInlayPropertyDeclarationTypeHints = true,
                --                 includeInlayFunctionLikeReturnTypeHints = true,
                --                 includeInlayEnumMemberValueHints = true,
                --             },
                --         },
                --     },
                -- },
                gopls = {
                    settings = {
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                    },
                },
                diagnosticls = {},
                sqlls = {},
                svelte = {},
                volar = {},
                eslint = {},
                tailwindcss = {},
                graphql = {},
                marksman = {},
                cssls = {},
                jsonls = {
                    -- lazy-load schemastore when needed
                    -- json schemas
                    on_new_config = function(new_config)
                        new_config.settings.json.schemas = new_config.settings.json.schemas
                            or {}
                        vim.list_extend(
                            new_config.settings.json.schemas,
                            require('schemastore').json.schemas()
                        )
                        -- yamlls schemas
                        new_config.settings.yamlls.schemas = new_config.settings.yamlls.schemas
                            or {}
                        vim.list_extend(
                            new_config.settings.yamlls.schemas,
                            require('schemastore').yamlls.schemas()
                        )
                    end,
                    settings = {
                        json = {
                            format = {
                                enable = true,
                            },
                            validate = { enable = true },
                        },
                    },
                },
                lua_ls = {
                    settings = {
                        Lua = {
                            hint = {
                                enable = true,
                                showParameterName = true,
                            },
                            workspace = {
                                checkThirdParty = false,
                                library = vim.api.nvim_get_runtime_file(
                                    '',
                                    true
                                ),
                            },
                            telemetry = { enable = false },
                            completion = {
                                callSnippet = 'Replace',
                            },
                            diagnostics = {
                                globals = {
                                    'vim',
                                    'use',
                                    'describe',
                                    'it',
                                    'assert',
                                    'before_each',
                                    'after_each',
                                },
                            },
                        },
                    },
                },
            },
            setup = {
                denols = function(_, opts)
                    -- start denols only if  deno.json exists
                    opts.root_dir = require('lspconfig').util.root_pattern(
                        'deno.json',
                        'deno.jsonc'
                    )
                    require('lspconfig').denols.setup(opts)
                end,
            },
        },
        config = function(_, opts)
            -- setup formatting and keymaps
            require('base.utils').on_attach(function(client, buffer)
                -- INFO: tsserver and typescript-tools conflicts with denols
                -- stop tsserver in deno project
                if
                    require('lspconfig').util.root_pattern(
                        'deno.json',
                        'import_map.json'
                    )(vim.fn.getcwd())
                then
                    vim.g.markdown_fenced_languages = {
                        'ts=typescript',
                    }
                    if
                        client.name == 'tsserver'
                        or client.name == 'typescript-tools'
                    then
                        client.stop()
                        return
                    end
                end

                require('plugins.lsp.format').on_attach(client, buffer)
                require('plugins.lsp.keymaps').on_attach(client, buffer)
            end)

            -- diagnostics
            for name, icon in pairs(require('base.icons').diagnostics) do
                name = 'DiagnosticSign' .. name
                vim.fn.sign_define(
                    name,
                    { text = icon, texthl = name, numhl = '' }
                )
            end

            vim.diagnostic.config {
                underline = true,
                update_in_insert = true,
                virtual_text = {
                    spacing = 4,
                    prefix = '●',
                    source = 'always',
                },
                severity_sort = true,
                float = { header = false, source = 'always' },
            }

            local servers = opts.servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            require('mason-lspconfig').setup {
                ensure_installed = vim.tbl_keys(servers),
            }
            require('mason-lspconfig').setup_handlers {
                function(server)
                    local server_opts = servers[server] or {}
                    server_opts.capabilities = capabilities
                    if opts.setup[server] then
                        if opts.setup[server](server, server_opts) then
                            return
                        end
                    elseif opts.setup['*'] then
                        if opts.setup['*'](server, server_opts) then
                            return
                        end
                    end
                    require('lspconfig')[server].setup(server_opts)
                end,
            }
        end,
    },
    -- Typesript tools
    {
        'pmizio/typescript-tools.nvim',
        dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        opts = {
            settings = {
                -- spawn additional tsserver instance to calculate diagnostics on it
                separate_diagnostic_server = true,
                -- "change"|"insert_leave" determine when the client asks the server about diagnostic
                publish_diagnostic_on = 'insert_leave',
                -- string|nil -specify a custom path to `tsserver.js` file, if this is nil or file under path
                -- not exists then standard path resolution strategy is applied
                tsserver_path = nil,
                -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
                -- (see 💅 `styled-components` support section)
                tsserver_plugins = {
                    '@styled/typescript-styled-plugin',
                },
                -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
                -- memory limit in megabytes or "auto"(basically no limit)
                tsserver_max_memory = 'auto',
                -- described below
                tsserver_format_options = {},
                tsserver_file_preferences = {},
            },
        },
    },
}
