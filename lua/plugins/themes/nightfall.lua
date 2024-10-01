return {
  "2giosangmitom/nightfall.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    require("nightfall").setup({})
    -- vim.cmd.colorscheme("nightfall") -- Variants: `deepernight`, `maron`
    vim.cmd.colorscheme("deepernight") -- Variants: `deepernight`, `maron`
    -- vim.cmd.colorscheme("maron") -- Variants: `deepernight`, `maron`
  end,
}
