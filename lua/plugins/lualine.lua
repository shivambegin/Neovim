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
        lualine_a = { { "fancy_cwd", icon = "" } },
        lualine_b = { { "fancy_branch", icon = "" } },
        lualine_c = { "fancy_diagnostics" },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = colours.green },
          },
          { "diff" },
          {},
        },
        lualine_y = {},
        lualine_z = { { "fancy_lsp_servers", icon = "" } },
      },
    })
  end,
}
