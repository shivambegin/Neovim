return {
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        enabled = false,
        opts = {
          transparent = true,
        },
        config = function()
          vim.cmd([[ colorscheme solarized-osaka]])
        end,
      },

}
