return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function ()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {"italic"},
        functions = {"italic"},
        keywords = {"bold"},
        strings = {},
        variables = {},
        numbers = {"italic"},
        booleans = {"italic"},
        properties = {},
        types = {},
        operators = {},
      },
      color_overrides = {},
      custom_highlights = function(colors)
        return {
          Comment = { fg = "#89AEB1"},
          LineNr = { fg = colors.overlay0 }
        }
      end,
      integrations = {
        cmp = true,
        gitsigns = false,
        nvimtree = false,
        treesitter = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })

    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
  end
}



--tokyonight



-- local M = {
--     "folke/tokyonight.nvim",
--     lazy = false,
--   }

--   M.colors = function()
--     local colors_ok, colors = pcall(require, "tokyonight.colors")
--     if not colors_ok then
--       return
--     end
--     return colors.setup({})
--   end

--   M.util = function()
--     local util_ok, util = pcall(require, "tokyonight.util")
--     if not util_ok then
--       return
--     end

--     return util
--   end

--   M.config = function()
--     local status_ok, tokyonight = pcall(require, "tokyonight")
--     if not status_ok then
--       return
--     end

--     tokyonight.setup({
--       style = "storm",
--       transparent = true,
--       terminal_colors = true,
--       styles = {
--         comments = { italic = true },
--         keywords = { italic = true },
--         functions = {},
--         variables = {},
--         sidebars = "transparent",
--         floats = "transparent",
--       },
--       sidebars = {
--         "terminal",
--         "packer",
--         "help",
--         "NvimTree",
--         "Trouble",
--         "LspInfo",
--       },
--       dim_inactive = false,
--       lualine_bold = false,
--       on_highlights = function(hl, c)
--         local util = require("tokyonight.util")
--         local darker_bg = util.darken(c.bg_popup, 2.5)
--         hl.LineNr.fg = c.comment
--         hl.CursorLineNr = {
--           fg = c.fg,
--           bold = true,
--         }
--         hl.WhichKeyGroup = {
--           fg = c.green,
--           bold = true,
--         }
--         hl.BufferVisibleMod = { fg = c.yellow, bg = c.bg }
--         hl.Folded = {
--           bg = util.lighten(c.bg_highlight, 0.98),
--         }
--         hl.WinSeparator = {
--           fg = util.darken(c.border_highlight, 0.3),
--         }
--         hl.NvimTreeSpecialFile = {
--           fg = c.yellow,
--           bold = true,
--         }
--         hl.EndOfBuffer = { bg = "NONE" }
--         hl.CmpDocumentation = { bg = darker_bg }
--         hl.CmpDocumentationBorder = { bg = darker_bg }
--         hl.TelescopeMatching = { fg = c.warning, bold = true }
--         hl.TreesitterContext = { bg = c.bg_highlight }
--         hl.NvimTreeFolderIcon = { fg = c.blue }
--         hl.CmpBorder = { fg = c.fg_gutter, bg = "NONE" }
--         hl.CmpDocBorder = { fg = c.fg_gutter, bg = "NONE" }
--         hl.TelescopeBorder = { fg = c.fg_gutter, bg = "NONE" }
--         hl.TelescopePromptTitle = { fg = c.blue, bg = "NONE" }
--         hl.TelescopeResultsTitle = { fg = c.teal, bg = "NONE" }
--         hl.TelescopePreviewTitle = { fg = c.fg, bg = "NONE" }
--         hl.TelescopePromptPrefix = { fg = c.blue, bg = "NONE" }
--         hl.TelescopeResultsDiffAdd = { fg = c.green, bg = "NONE" }
--         hl.TelescopeResultsDiffChange = { fg = c.yellow, bg = "NONE" }
--         hl.TelescopeResultsDiffDelete = { fg = c.red, bg = "NONE" }
--         hl.TelescopeMatching = { fg = c.green, bold = true, bg = "NONE" }
--         hl.FoldColumn = { fg = c.blue }
--         hl.DevIconFish = { fg = c.green }
--         hl.GHThreadSep = { bg = c.bg_float }
--         hl.markdownH1 = { bg = c.bg_float }
--         hl.DiagnosticUnnecessary = { fg = util.lighten(c.comment, 0.7), undercurl = true }
--       end,
--     })

--     tokyonight.load()
--   end

--   return M

