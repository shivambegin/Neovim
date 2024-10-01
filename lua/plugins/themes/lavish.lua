return {
  "ferdinandrau/lavish.nvim",
  enabled = false,
  priority = 1000,
  config = function()
    require("lavish").apply()
  end,
}
