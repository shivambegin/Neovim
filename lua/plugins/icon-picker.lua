return {
  "ziontee113/icon-picker.nvim",
  config = function()
    require("icon-picker").setup({ disable_legacy_commands = true })

    local opts = { noremap = true, silent = true }

    vim.keymap.set("n", "<Leader>ti", "<cmd>IconPickerNormal<cr>", opts)
    vim.keymap.set("n", "<Leader>ty", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
    vim.keymap.set("n", "<Leader>te", "<cmd>IconPickerInsert emoji<cr>", opts)
  end,
}
