-- Neovim plugin to improve the default vim.ui interfaces
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = { default_prompt = "➤ " },
    select = { backend = { "telescope", "builtin" } },
  },
}
