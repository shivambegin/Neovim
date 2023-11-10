return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    lazy = false,
    enabled = true,
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'NeoSolarized',
          component_separators = { left = '', right = ''},
          section_separators = { left = '', right = ''},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = {'buffers'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'mode'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end,
  }
}
-- return {
--   {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy",
--     lazy = false,
--     enabled = true,
--     config = function()
--           globalstatus = true,
--           disabled_filetypes = { statusline = { "dashboard", "alpha" } },
--         },
--         sections = {
--           lualine_a = { { "mode", icon = "" } },
--           lualine_b = { { "branch", icon = "" } },
--           lualine_c = {
--             {
--               "diagnostics",
--               symbols = {
--                 error = " ",
--                 warn = " ",
--                 info = " ",
--                 hint = "󰝶 ",
--               },
--             },
--             { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
--             {
--               "filename",
--               symbols = { modified = "  ", readonly = "", unnamed = "" },
--             },
--             {
--               function()
--                 local msg = "Disabled"
--                 local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
--                 local clients = vim.lsp.get_active_clients()
--                 if next(clients) == nil then
--                   return msg
--                 end
--                 for _, client in ipairs(clients) do
--                   local filetypes = client.config.filetypes
--                   if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--                     return client.name
--                   end
--                 end
--                 return msg
--               end,
--               icon = " LSP:",
--               },
--           },
--           lualine_x = {
--             {
--               require("lazy.status").updates,
--               cond = require("lazy.status").has_updates,
--             },
--             {
--               function()
--                 local icon = " "
--                 local status = require("copilot.api").status.data
--                 return icon .. (status.message or "")
--               end,
--               cond = function()
--                 local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
--                 return ok and #clients > 0
--               end,
--               color = function()
--                 if not package.loaded["copilot"] then
--                   return
--                 end
--                 local status = require("copilot.api").status.data
--                 return copilot_colours[status.status] or copilot_colours[""]
--               end,
--             },
--             { "diff" },
--           },
--           lualine_y = {
--             {
--               "buffers",
--             },
--             {
--               "location",
--             },
--           },
--           lualine_z = {
--             function()
--               return "  " .. os.date("%X") .. " 📎"
--             end,
--           },
--         },
--         tabline = {
--           lualine_a = { "diagnostics" },
--           lualine_b = {},
--           lualine_c = {},
--           lualine_x = {},
--           lualine_y = {},
--           lualine_z = {},
--         },

--         extensions = { "lazy" },
--       }
--     end,
--   },
-- }
