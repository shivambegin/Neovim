return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme carbonfox")
    end,
  },
  {
    "ayu-theme/ayu-vim",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme ayu")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim", -- theme
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "hard",
        palette_overrides = { dark0_hard = "#0E1018" },
        overrides = {
          -- Comment = {fg = "#626A73", italic = true, bold = true},
          -- #736B62,  #626273, #627273
          NormalFloat = { fg = "#ebdbb2", bg = "#504945" },
          Comment = { fg = "#81878f", italic = true, bold = true },
          Define = { link = "GruvboxPurple" },
          Macro = { link = "GruvboxPurple" },
          ["@constant.builtin"] = { link = "GruvboxPurple" },
          ["@storageclass.lifetime"] = { link = "GruvboxAqua" },
          ["@text.note"] = { link = "TODO" },
          ["@namespace.rust"] = { link = "Include" },
          ["@punctuation.bracket"] = { link = "GruvboxOrange" },
          texMathDelimZoneLI = { link = "GruvboxOrange" },
          texMathDelimZoneLD = { link = "GruvboxOrange" },
          ContextVt = { fg = "#878788" },
          CopilotSuggestion = { fg = "#878787" },
          CocCodeLens = { fg = "#878787" },
          CocWarningFloat = { fg = "#dfaf87" },
          CocInlayHint = { fg = "#ABB0B6" },
          CocPumShortcut = { fg = "#fe8019" },
          CocPumDetail = { fg = "#fe8019" },
          DiagnosticVirtualTextWarn = { fg = "#dfaf87" },
          -- fold
          Folded = { fg = "#fe8019", bg = "#3c3836", italic = true },
          FoldColumn = { fg = "#fe8019", bg = "#0E1018" },
          SignColumn = { bg = "#fe8019" },
          -- new git colors
          DiffAdd = {
            bold = true,
            reverse = false,
            fg = "",
            bg = "#2a4333",
          },
          DiffChange = {
            bold = true,
            reverse = false,
            fg = "",
            bg = "#333841",
          },
          DiffDelete = {
            bold = true,
            reverse = false,
            fg = "#442d30",
            bg = "#442d30",
          },
          DiffText = {
            bold = true,
            reverse = false,
            fg = "",
            bg = "#213352",
          },
          -- statusline
          StatusLine = { bg = "#ffffff", fg = "#0E1018" },
          StatusLineNC = { bg = "#3c3836", fg = "#0E1018" },
          CursorLineNr = { fg = "#fabd2f", bg = "" },
          GruvboxOrangeSign = { fg = "#dfaf87", bg = "" },
          GruvboxAquaSign = { fg = "#8EC07C", bg = "" },
          GruvboxGreenSign = { fg = "#b8bb26", bg = "" },
          GruvboxRedSign = { fg = "#fb4934", bg = "" },
          GruvboxBlueSign = { fg = "#83a598", bg = "" },
          WilderMenu = { fg = "#ebdbb2", bg = "" },
          WilderAccent = { fg = "#f4468f", bg = "" },
          -- coc semantic token
          CocSemStruct = { link = "GruvboxYellow" },
          CocSemKeyword = { fg = "", bg = "#0E1018" },
          CocSemEnumMember = { fg = "", bg = "#0E1018" },
          CocSemTypeParameter = { fg = "", bg = "#0E1018" },
          CocSemComment = { fg = "", bg = "#0E1018" },
          CocSemMacro = { fg = "", bg = "#0E1018" },
          CocSemVariable = { fg = "", bg = "#0E1018" },
          CocSemFunction = { fg = "", bg = "#0E1018" },
          -- neorg
          ["@neorg.markup.inline_macro"] = { link = "GruvboxGreen" },
        },
      })
      vim.cmd.colorscheme("gruvbox")
    end,
  },
  {
    "tomasr/molokai",
    lazy = true,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme molokai")
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = true, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require("github-theme").setup({
        options = {
          transparent = true,
          hide_nc_statusline = false,
          hide_end_of_buffer = false,
          inverse = {
            match_paren = true,
            -- visual = true,
            search = true,
          },
          darken = {
            sidebars = {
              enabled = false,
            },
          },
        },
        groups = {
          all = {
            ["@label.jsonc"] = { link = "@label.json" },
          },
        },
      })

      vim.g.github_theme_debug = true

      vim.cmd("colorscheme github_dark_dimmed")
    end,
  },
  {
    "jesseleite/nvim-noirbuddy",
    dependencies = {
      { "tjdevries/colorbuddy.nvim" },
    },
    lazy = true,
    priority = 1000,
    opts = {
      preset = "minimal",
    },
  },
}
