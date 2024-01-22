return {
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({})
    end,
    event = "BufReadPost",
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
      require("ibl").setup()
    end,
  },
}
