return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
  },
  event = "VeryLazy",
  config = function()
    local lualine = require("lualine")
    local colours = {
      bg = "#1d202100",
      fg = "#ebdbb2",
      grey = "#a89984",
      green = "#98971a",
      yellow = "#d79921",
      blue = "#458588",
      magenta = "#b16286",
      red = "#cc241d",
      cyan = "#689d6a",
      orange = "#d65d0e",
    }
    lualine.setup({
      options = {
        refresh = {
          statusline = 100,
        },
        component_separators = { left = " ", right = " " },
        theme = {
          normal = {
            a = { fg = colours.blue, bg = colours.bg },
            b = { fg = colours.cyan, bg = colours.bg },
            c = { fg = colours.fg, bg = colours.bg },
            x = { fg = colours.fg, bg = colours.bg },
            y = { fg = colours.magenta, bg = colours.bg },
            z = { fg = colours.grey, bg = colours.bg },
          },
          insert = {
            a = { fg = colours.green, bg = colours.bg },
            z = { fg = colours.grey, bg = colours.bg },
          },
          visual = {
            a = { fg = colours.magenta, bg = colours.bg },
            z = { fg = colours.grey, bg = colours.bg },
          },
          terminal = {
            a = { fg = colours.orange, bg = colours.bg },
            z = { fg = colours.grey, bg = colours.bg },
          },
        },
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha" } },
      },
      sections = {
        lualine_a = {},
        lualine_b = {
          "fancy_branch",
        },
        lualine_c = {
          {
            "filename",
            path = 1, -- 2 for full path
            symbols = {
              modified = "  ",
            },
          },
          { "fancy_diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
          { "fancy_searchcount" },
        },
        lualine_x = {
          "fancy_lsp_servers",
          "fancy_diff",
          "progress",
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "neo-tree", "lazy" },
    })
  end,
}
