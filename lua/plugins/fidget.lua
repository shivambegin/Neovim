return {
  "j-hui/fidget.nvim",
  tag = "legacy",
  event = "LspAttach",
  config = function()
    local icons_ok, icons = pcall(require, "config.icons")
    if not icons_ok then
      print("Unable to import icons!")
    end
    local fidget_status_ok, fidget = pcall(require, "fidget")
    if not fidget_status_ok then
      print("fidget not found!")
    end
    fidget.setup({
      text = {
        spinner = {
          "⣷",
          "⣯",
          "⣟",
          "⡿",
          "⢿",
          "⣻",
          "⣽",
          "⣾",
        },
        done = icons.ui.Check .. "Successfully Initialized:",
        commenced = icons.ui.CircleSmallEmpty,
        completed = icons.ui.CircleSmall,
      },
      window = {
        relative = "editor",
        blend = 0,
        border = "none",
      },
      debug = {
        logging = true,
        strict = true,
      },
    })
  end,
}
