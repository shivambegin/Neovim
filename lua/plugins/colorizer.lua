return {
    'NvChad/nvim-colorizer.lua',
    event = 'BufReadPost',
    cmd = {
        'ColorizerToggle',
        'ColorizerAttachToBuffer',
        'ColorizerDetachFromBuffer',
        'ColorizerReloadAllBuffers',
    },
    opts = { user_default_options = { names = true } },
    config = function()
        require('colorizer').setup()
    end,
}
