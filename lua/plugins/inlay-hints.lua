return {
  "MysticalDevil/inlay-hints.nvim",
  enabled = false,
  event = "LspAttach",
  dependencies = { "neovim/nvim-lspconfig" },
  config = function()
    require("inlay-hints").setup()
  end,
}
