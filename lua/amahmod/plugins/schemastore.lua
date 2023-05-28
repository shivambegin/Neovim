return {
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'b0o/SchemaStore.nvim' },
        opts = {
            -- make sure mason installs the server
            servers = {
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
            },
        },
    },
}
