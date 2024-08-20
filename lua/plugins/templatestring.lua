return {
  "axelvc/template-string.nvim",
  ft = { "html", "typescript", "javascript", "typescriptreact", "javascriptreact", "vue", "svelte", "python" }, -- filetypes where the plugin is active
  -- event = "InsertEnter",
  config = function()
    require("template-string").setup({})
  end,
}
