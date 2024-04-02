return {
  {
    "nmac427/guess-indent.nvim",
    enabled = true,
    config = function()
      require("guess-indent").setup({})
    end,
    event = "BufReadPost",
  },
}
