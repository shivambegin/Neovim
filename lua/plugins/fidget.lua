return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  opts = {
    progress = {
      suppress_on_insert = true,
      display = {
        done_ttl = 2,
        progress_icon = { pattern = "grow_horizontal", period = 0.75 },
        done_style = "NonText",
        group_style = "NonText",
        icon_style = "NonText",
        progress_style = "NonText",
      },
    },
    notification = {
      window = {
        border_hl = "NonText",
        normal_hl = "NonText",
        winblend = 0,
      },
    },
  },
}
