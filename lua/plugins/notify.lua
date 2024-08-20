return {
  "rcarriga/nvim-notify",
  enabled = false,
  event = "VeryLazy",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss All Notifications",
    },
  },
  opts = {
    level = 2,
    minimum_width = 50,
    stages = "fade",
    timeout = 3000,
    top_down = true,
    render = "compact",
    background_colour = "#000000",
  },
}
