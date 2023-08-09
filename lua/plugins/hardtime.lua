return {
    'm4xshen/hardtime.nvim',
    event = 'VeryLazy',
    config = function()
        require('hardtime').setup()
    end,
    enabled = false
}
