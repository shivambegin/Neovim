-- A better annotation generator.
-- TODO: find the usage of this plugin
return {
  "danymat/neogen",
  enabled = false,
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("neogen").setup({
      enabled = true,
      snippet_engine = "luasnip",
      languages = {
        python = {
          template = {
            annotation_convention = "google_docstrings",
          },
        },
      },
    })
  end,
  init = function()
    vim.keymap.set(
      "n",
      "<leader>cd",
      ":lua require('neogen').generate()<CR>",
      { silent = true, desc = "Generate Documentation" }
    )
  end,
}
