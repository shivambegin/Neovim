return {
  {
    "xiyaowong/transparent.nvim",
    enabled = true,
    config = function()
      require("transparent").setup({ -- Optional, you don't have to run setup.
        groups = { -- table: default groups
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
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
          --"CursorLine",
          --"CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
        },
        extra_groups = {
          "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
          "OctoEditable",
          "NvimTreeNormal", -- NvimTree
          "EndOfBuffer",
          "TelescopeNormal",
          "TelescopeBorder",
          "PMenu",
          "PMenuBorder",
          "FloatBorder",
          "Search",
          "Cursor",
          "NvimTree",
          "NvimTreeNormal",
          "NvimTreeNormalNC",
          "WinbarNormal",
          "WinbarNormalNC",
          "NavicIcons",
          "NavicIconsFile",
          "NavicIconsModule",
          "NavicText",
          "NavicSeparator",
          "LazyNormal",
          "BufferlineNormal",
        }, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end,
  },
}
