return{
    'nvimdev/lspsaga.nvim',
    enabled = true,
    config = function()
        require('lspsaga').setup({
            symbol_in_winbar = {
                enable = true,
                hide_keyword = false,
                show_file = true,
                folder_level = 2,
                color_mode = true,
                delay = 300
            }
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons' ,    -- optional
    }
}
