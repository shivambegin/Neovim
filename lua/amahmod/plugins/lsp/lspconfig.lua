return {
    {
        'neovim/nvim-lspconfig',
        event = 'BufReadPre',
        dependencies = {
            'mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        opts = {
            servers = {
                html = {},
                emmet_ls = {},
                yamlls = {},
                dockerls = {},
                tsserver = {
                    settings = {
                        typescript = {
                            inlayHints = {
                                includeInlayParameterNameHints = 'all',
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                        javascript = {
                            inlayHints = {
                                includeInlayParameterNameHints = 'all',
                                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                                includeInlayFunctionParameterTypeHints = true,
                                includeInlayVariableTypeHints = true,
                                includeInlayPropertyDeclarationTypeHints = true,
                                includeInlayFunctionLikeReturnTypeHints = true,
                                includeInlayEnumMemberValueHints = true,
                            },
                        },
                    },
                },
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
                jsonls = {},
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
            -- you can do any additional lsp server setup here
            -- return true if you don't want this server to be setup with lspconfig
            setup = {
                -- example to setup with typescript.nvim
                -- tsserver = function(_, opts)
                --   require("typescript").setup({ server = opts })
                --   return true
                -- end,
                -- Specify * to use this function as a fallback for any server
                -- ["*"] = function(server, opts) end,
            },
        },
        config = function(_, opts)
            -- setup formatting and keymaps
            require('amahmod.util').on_attach(function(client, buffer)
                require('amahmod.plugins.lsp.helpers.format').on_attach(
                    client,
                    buffer
                )
                require('amahmod.plugins.lsp.helpers.keymaps').on_attach(
                    client,
                    buffer
                )
            end)

            -- diagnostics
            for name, icon in
                pairs(require('amahmod.configs.icons').diagnostics)
            do
                name = 'DiagnosticSign' .. name
                vim.fn.sign_define(
                    name,
                    { text = icon, texthl = name, numhl = '' }
                )
            end
            vim.diagnostic.config {
                underline = true,
                update_in_insert = false,
                virtual_text = {
                    spacing = 4,
                    prefix = '●',
                    source = 'always',
                },
                severity_sort = true,
                float = { header = false, source = 'always' },
            }

            local servers = opts.servers
            local capabilities = require('cmp_nvim_lsp').default_capabilities(
                vim.lsp.protocol.make_client_capabilities()
            )

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
}
