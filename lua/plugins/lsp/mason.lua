return {
    'williamboman/mason.nvim',
    cmd = {
        'Mason',
        'MasonInstall',
        'MasonUninstall',
        'MasonUninstallAll',
        'MasonLog',
        'MasonUpdate',
        'MasonUpdateAll',
    },
    build = ':MasonUpdate',
    opts = {
        ensure_installed = {},
        ui = {
            icons = {
                package_installed = '✓',
                package_uninstalled = '✗',
                package_pending = '⟳',
            },
        },
    },
    config = function(_, opts)
        require('mason').setup(opts)

        local mr = require 'mason-registry'
        for _, tool in ipairs(opts.ensure_installed) do
            local p = mr.get_package(tool)
            if not p:is_installed() then
                p:install()
            end
        end
    end,
}
