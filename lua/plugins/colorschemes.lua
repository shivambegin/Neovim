return {
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim",
    },
    opts = {
      reverse_visual = true,
      dim_nc = true,
      cmp_cmdline_disable_search_highlight_group = true,
      diagnostic_virtual_text_background = true,
      transparent_background = true,
      transparent_float_background = true, -- aka pum(popup menu) background
    },
    config = function()
      vim.cmd([[colorscheme vitesse]])
    end,
  },
}
