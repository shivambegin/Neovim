return {
    "dnlhc/glance.nvim",
    lazy = true,
    enabled = false,
    keys = {
      { "gD", "<CMD>Glance definitions<CR>", desc = "Show Definitions" },
      { "gr", "<CMD>Glance references<CR>", desc = "Show References" },
      { "gY", "<CMD>Glance type_definitions<CR>", desc = "Show Type Definitions" },
      { "gM", "<CMD>Glance implementations<CR>", desc = "Show Implementation" },
    },
    config = function()
      require("glance").setup({
        border = {
          enable = true,
          top_char = "─",
          bottom_char = "─",
        },
        theme = {
          enable = false,
        },
        folds = {
          folded = false,
        },
      })

      local colors = require("tokyonight.colors").setup()
      vim.api.nvim_set_hl(0, "GlanceWinBarTitle", { fg = colors.blue, bg = colors.bg_float, bold = true })
      vim.api.nvim_set_hl(0, "GlanceListNormal", { bg = colors.bg_float })
      vim.api.nvim_set_hl(0, "GlancePreviewNormal", { bg = colors.bg_dark })
      vim.api.nvim_set_hl(0, "GlanceBorderTop", { fg = colors.border_highlight, bg = colors.bg_dark })
      vim.api.nvim_set_hl(0, "GlanceWinBarFilename", { fg = colors.fg_dark, bg = colors.bg_dark, bold = true })
      vim.api.nvim_set_hl(0, "GlanceWinBarFilepath", { fg = colors.fg_dark, bg = colors.bg_dark })
      vim.api.nvim_set_hl(0, "GlancePreviewBorderBottom", { fg = colors.border_highlight, bg = colors.bg_dark })
      vim.api.nvim_set_hl(0, "GlanceListMatch", { bg = colors.none, fg = colors.yellow })
      vim.api.nvim_set_hl(0, "GlancePreviewMatch", { fg = colors.bg_dark, bg = colors.yellow })
      vim.api.nvim_set_hl(0, "GlanceListBorderBottom", { fg = colors.border_highlight, bg = colors.bg_dark })
    end,
  }
