return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
  },
  enabled = true,
  lazy = false,
  event = { "BufNewFile", "BufReadPost", "VeryLazy" },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        component_separators = "|",
        section_separators = "",
        theme = "auto",
      },
      sections = {
        lualine_x = {
          "fancy_diagnostics",
        },
        lualine_a = {
          { "fancy_mode" },
        },
        lualine_z = {
          { "fancy_lsp_servers" },
        },
      },
    })
  end,
}
