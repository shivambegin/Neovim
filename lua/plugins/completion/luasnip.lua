return {
    'L3MON4D3/LuaSnip',
    dependencies = {
        'zeioth/friendly-snippets',
        'benfowler/telescope-luasnip.nvim',
    },
    event = 'InsertEnter',
    config = function(_, opts)
        if opts then
            require('luasnip').config.setup(opts)
        end
        vim.tbl_map(function(type)
            require('luasnip.loaders.from_' .. type).lazy_load()
        end, { 'vscode', 'snipmate', 'lua' })
        -- friently-snippets - enable standardized comments snippets
        require('luasnip').filetype_extend('typescript', { 'tsdoc' })
        require('luasnip').filetype_extend('javascript', { 'jsdoc' })
        require('luasnip').filetype_extend('lua', { 'luadoc' })
        require('luasnip').filetype_extend('python', { 'pydoc' })
        require('luasnip').filetype_extend('rust', { 'rustdoc' })
        require('luasnip').filetype_extend('cs', { 'csharpdoc' })
        require('luasnip').filetype_extend('java', { 'javadoc' })
        require('luasnip').filetype_extend('c', { 'cdoc' })
        require('luasnip').filetype_extend('cpp', { 'cppdoc' })
        require('luasnip').filetype_extend('php', { 'phpdoc' })
        require('luasnip').filetype_extend('kotlin', { 'kdoc' })
        require('luasnip').filetype_extend('ruby', { 'rdoc' })
        require('luasnip').filetype_extend('sh', { 'shelldoc' })
        --require("luasnip").filetype_extend("shell", { "doxygen" })
    end,
}
