return {
  "gelguy/wilder.nvim",
  enabled = false,
  config = function()
    local wilder = require("wilder")
    wilder.setup({ modes = { ":", "/", "?" } })
  end,
}
