return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = 'macchiato'

        },
        config = function(_, opts)
            local catppuccin = require 'catppuccin'
            catppuccin.setup (opts)
            vim.cmd.colorscheme "catppuccin"
        end
    }
}
