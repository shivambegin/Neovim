return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      require("nightfox").setup({
        fox = "carbonfox",
        transparent = true,
        styles = {
          comments = "NONE",
          functions = "NONE",
          keywords = "NONE",
          strings = "NONE",
          variables = "NONE",
        },
      })
      vim.cmd([[ :colorscheme carbonfox]])
    end,
  },
}
