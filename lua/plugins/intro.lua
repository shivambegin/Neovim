return {
  "OXY2DEV/intro.nvim",
  enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("intro").setup({
      preset = {
        name = "startify",
        opts = { "green", "recents", "list_shade" },
      },
    })
  end,
}
