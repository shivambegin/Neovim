return {
  {
    "mcchrish/zenbones.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme neobones]])
    end,
  },
}
