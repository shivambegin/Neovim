return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = {"BufReadPre", "BufNewFile"},
    enabled = true,
    config = function()
      require("ibl").setup({
        scope = { enabled = false },
      })
    end,
  },
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup({})
    end,
    event = "BufReadPost",
  }
}
