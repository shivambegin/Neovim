return {
  {
    "xiyaowong/transparent.nvim",
    event = "VeryLazy",
    enabled = true,
    config = function()
      require("transparent").clear_prefix("WinBar")
      require("transparent").clear_prefix("Navic")
      require("transparent").clear_prefix("Float")
      -- require("transparent").clear_prefix("Normal")
      require("transparent").clear_prefix("NeoTree")
      require("transparent").clear_prefix("Noice")
      require("transparent").clear_prefix("Notify")
      require("transparent").clear_prefix("GitSigns")
      require("transparent").clear_prefix("Mini")
      require("transparent").clear_prefix("WhichKey")
      require("transparent").clear_prefix("BufferLine")
      require("transparent").clear_prefix("Tab")
      require("transparent").clear_prefix("Telescope")
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
          "StatusLine",
          "StatusLineNC",
          "EndOfBuffer",
          "SignColumn",
          "HoverNormal",
        },
        extra_groups = {
          "OctoEditable",
          "EndOfBuffer",
          "Search",
          "Cursor",
          "LazyNormal",
        }, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
        on_clear = function() end,
      })
    end,
  },
}
