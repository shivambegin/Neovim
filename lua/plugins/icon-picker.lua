return {
  "ziontee113/icon-picker.nvim",
  enabled = true,
  cmd = { "IconPickerInsert" },
  keys = {
    {
      "<Leader>se",
      "<cmd>IconPickerInsert emoji<cr>",
      desc = "Emoji",
    },
  },
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })
  end,
}
