return {
  "declancm/cinnamon.nvim",
  event = { "BufReadPost", "BufNewFile" },
  version = "*",
  opts = {},
  config = function()
    require("cinnamon").setup({
      -- Enable all provided keymaps
      keymaps = {
        basic = true,
        extra = true,
      },
      -- Only scroll the window
      options = { mode = "window" },
    })
  end,
}
