return {
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
          styles = {
            comments = "italic",
          },
        },
      })
      vim.cmd("colorscheme duskfox")
    end,
  },
}
