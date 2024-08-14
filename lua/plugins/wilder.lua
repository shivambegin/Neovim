return {
  "gelguy/wilder.nvim",
  enabled = false,
  keys = {
    ":",
  },
  config = function()
    local wilder = require("wilder")
    wilder.setup({
      modes = { "/", "?", ":" },
      pipeline = {
        wilder.cmdline_pipeline({
          fuzzy = 2,
        }),
      },
    })
    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer({
        highlighter = wilder.basic_highlighter(),
        highlights = {
          border = "TelescopeBorder",
          accent = wilder.make_hl("WilderAccent", "Pmenu", { { a = 1 }, { a = 1 }, { foreground = "#5FF1FF" } }),
        },
        left = { " ", wilder.popupmenu_devicons() },
        right = { " ", wilder.popupmenu_scrollbar() },
        border = "rounded",
        pumblend = 0,
      })
    )
  end,
}
