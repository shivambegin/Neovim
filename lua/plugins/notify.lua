return {
  "rcarriga/nvim-notify",
  enabled = false,
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },
  opts = {
    timeout = 5000,
    background_colour = "#000000",
    render = "wrapped-compact",
  },
}
