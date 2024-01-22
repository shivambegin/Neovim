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
      },
      sections = {
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_a = {
          {
            "buffers",
          },
        },
        lualine_z = {
          { "fancy_lsp_servers" },
        },
      },
    })
  end,
}
