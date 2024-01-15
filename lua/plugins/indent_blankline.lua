return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "InsertEnter" },
    opts = {},
    config = function()
      require("ibl").setup()
    end,
  },
}
