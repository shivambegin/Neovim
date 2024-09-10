return {
  "Alexis12119/nightly.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("nightly").setup({
      transparent = false,
      styles = {
        comments = { italic = true },
        functions = { italic = false },
        variables = { italic = false },
        keywords = { italic = false },
      },
      highlights = {},
    })
    vim.cmd.colorscheme("nightly")
  end,
}
