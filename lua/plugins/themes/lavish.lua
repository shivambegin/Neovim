return {
  "ferdinandrau/lavish.nvim",
  enabled = true,
  priority = 1000,
  config = function()
    require("lavish").apply()
  end,
}
