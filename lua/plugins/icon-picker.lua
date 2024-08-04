return {
  "ziontee113/icon-picker.nvim",
  enabled = true,
  cmd = { "IconPickerInsert" },
  vim.keymap.set("n", "<Leader>se", "<cmd>IconPickerInsert emoji<cr>"),
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })
  end,
}
