return {
  "Alexis12119/nightly.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  config = function()
    require("nightly").setup({
      transparent = true,
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
