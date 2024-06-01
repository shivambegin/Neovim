return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {},
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
}
