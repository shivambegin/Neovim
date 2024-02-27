return {
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").clear_prefix("Normal")
      require("transparent").clear_prefix("Navic")
      require("transparent").clear_prefix("Mason")
      require("transparent").clear_prefix("Lazy")
      require("transparent").clear_prefix("PMenu")
      require("transparent").clear_prefix("Float")
      require("transparent").clear_prefix("NeoTree")
      require("transparent").clear_prefix("Noice")
      require("transparent").clear_prefix("NvimTree")
      -- require("transparent").clear_prefix("Telescope")
      require("transparent").clear_prefix("Notify")
      require("transparent").clear_prefix("GitSigns")
      require("transparent").clear_prefix("Satellite")
      require("transparent").clear_prefix("lualine")
      require("transparent").clear_prefix("BufferLine")
      require("transparent").clear_prefix("Fidget")
      require("transparent").clear_prefix("barbecue")
      require("transparent").clear_prefix("Mini")
      -- require("transparent").clear_prefix("Tab")
      require("transparent").setup({ -- Optional, you don't have to run setup.
        groups = { -- table: default groups
          "Comment",
          "Constant",
          "TabLineFill",
          "Special",
          "WinBar",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLine",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
          "SignColumn",
        },
        extra_groups = {
          "OctoEditable",
          "NvimTreeNormal", -- NvimTree
          "EndOfBuffer",
          "Search",
          "Cursor",
          "WinbarNormal",
          "WinbarNormalNC",
          "NavicIcons",
          "NavicIconsFile",
          "WinSeparator",
          "NavicIconsModule",
          "NavicText",
          "NavicSeparator",
          "LazyNormal",
        }, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end,
  },
}
