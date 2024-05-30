return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      vim.keymap.set({ "n", "t" }, "<A-t>", "<cmd>ToggleTerm<cr>"),
    })
  end,
}
