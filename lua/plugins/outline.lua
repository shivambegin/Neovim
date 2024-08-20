return {
  "hedyhli/outline.nvim",
  event = "LspAttach",
  config = function()
    vim.keymap.set("n", "<leader>ot", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
    require("outline").setup({})
  end,
}
