return {
  "ziontee113/icon-picker.nvim",
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<Leader>te", "<cmd>IconPickerInsert emoji<cr>", opts)
  end,
}
