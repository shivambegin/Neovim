--rarely maintained plugin
return {
  "tamton-aquib/keys.nvim",
  cmd = "KeysToggle",
  vim.keymap.set("n", "<leader>kt", "<cmd>KeysToggle<CR>", { desc = "Toggle keys" }),
  config = function()
    require("keys").setup({
      enable_on_startup = false,
      win_opts = {
        width = 25,
      },
    })
  end,
}
