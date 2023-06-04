return {
    {
        'jose-elias-alvarez/null-ls.nvim',
        event = 'BufReadPre',
        dependencies = { 'mason.nvim' },
        opts = function()
            local nls = require 'null-ls'
            return {
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
            }
        end,
    },
}
