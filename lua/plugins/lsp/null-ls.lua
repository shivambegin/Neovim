return {
    {
        'jay-babu/mason-null-ls.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = {
            'williamboman/mason.nvim',
            'jose-elias-alvarez/null-ls.nvim',
        },
        config = function()
            local nls = require 'null-ls'
            nls.setup {
                sources = {
                    -- formatting
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.shfmt,
                    -- stylua: ignore
                    nls.builtins.formatting.prettierd.with { extra_filetypes = { 'svelte' }, },
                    nls.builtins.formatting.rustfmt,
                    nls.builtins.formatting.gofumpt,

                    -- code actions
                    nls.builtins.code_actions.eslint_d,
                    nls.builtins.code_actions.gitsigns,
                    nls.builtins.code_actions.refactoring,

                    -- diagnostic
                    nls.builtins.diagnostics.yamllint,
                    -- nls.builtins.diagnostics.commitlint,
                },
                on_attach = function()
                    require('base.utils').on_attach(function(client, buffer)
                        require('plugins.lsp.format').on_attach(client, buffer)
                        require('plugins.lsp.keymaps').on_attach(client, buffer)
                    end)
                end,
            }
            require('mason-null-ls').setup {
                ensure_installed = nil,
                automatic_installation = true,
            }
        end,
    },
}
