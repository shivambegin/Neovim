return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "joshdick/onedark.vim",
    "meuter/lualine-so-fancy.nvim",
  },
  config = function()
    local auto_theme_custom = require("lualine.themes.onedark")
    auto_theme_custom.normal.c.bg = "none"
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = auto_theme_custom,
        disabled_filetypes = {},
        -- section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
        section_separators = {},
        component_separators = {},
        always_divide_middle = true,
        globalstatus = false,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "none" },
        lualine_c = { "fancy_branch" },
        lualine_x = { "fancy_diff", "fancy_diagnostics" },
        lualine_y = { "none" },
        lualine_z = { "fancy_lsp_servers" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {},
    })
  end,
}
