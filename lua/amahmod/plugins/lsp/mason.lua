return {
    {

        'williamboman/mason.nvim',
        cmd = 'Mason',
        keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
        opts = {
            ensure_installed = {
                'stylua',
                'shellcheck',
                'shfmt',
            },
        },
        config = function(plugin, opts)
            if plugin.ensure_installed then
                require('amahmod.util').deprecate(
                    'treesitter.ensure_installed',
                    'treesitter.opts.ensure_installed'
                )
            end
            require('mason').setup(opts)
            local mr = require 'mason-registry'
            for _, tool in ipairs(opts.ensure_installed) do
                local p = mr.get_package(tool)
                if not p:is_installed() then
                    p:install()
                end
            end
        end,
    },
}
