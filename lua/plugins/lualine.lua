return {
  "nvim-lualine/lualine.nvim",
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
    local copilot_colours = {
      [""] = { fg = colours.grey, bg = colours.bg },
      ["Normal"] = { fg = colours.grey, bg = colours.bg },
      ["Warning"] = { fg = colours.red, bg = colours.bg },
      ["InProgress"] = { fg = colours.yellow, bg = colours.bg },
    }

    lualine.setup({
      options = {
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
        lualine_a = { { "mode", icon = "" } },
        lualine_b = { { "branch", icon = "" } },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
            },
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", symbols = { modified = "  ", readonly = "", unnamed = "" } },
          -- {
          --   function()
          --     return require("nvim-navic").get_location()
          --   end,
          --   cond = function()
          --     return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
          --   end,
          --   color = { fg = colours.grey, bg = colours.bg },
          -- },
        },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = colours.green },
          },
          {
            function()
              local icon = " "
              local status = require("copilot.api").status.data
              return icon .. (status.message or "")
            end,
            cond = function()
              local ok, clients = pcall(vim.lsp.get_clients, { name = "copilot", bufnr = 0 })
              return ok and #clients > 0
            end,
            color = function()
              if not package.loaded["copilot"] then
                return
              end
              local status = require("copilot.api").status.data
              return copilot_colours[status.status] or copilot_colours[""]
            end,
          },
          { "diff" },
        },
        lualine_y = {},
        lualine_z = {
          function()
            return "󰥔  " .. os.date("%X")
          end,
        },
      },
    })
  end,
}
