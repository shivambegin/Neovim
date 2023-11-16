return {
  {
    "lukas-reineke/indent-blankline.nvim",
    event = {"BufReadPre", "BufNewFile"},
    enabled = true,
    config = function()
      require("ibl").setup()
    end,
  },
}
