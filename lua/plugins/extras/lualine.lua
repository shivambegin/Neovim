return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
  },
  event = { "BufReadPost", "BufAdd", "BufNewFile" },
  enabled = false,
  opts = {
    options = {
      theme = "auto",
      component_separators = { left = "│", right = "│" },
      section_separators = { left = "", right = "" },
      globalstatus = true,
      refresh = {
        statusline = 1000,
      },
    },
    tabline = {
      lualine_a = { "buffers" },
      lualine_z = { "tabs" },
    },
    sections = {
      lualine_a = {
        { "fancy_branch" },
      },
      lualine_b = { "none" },
      lualine_c = {
        {
          "filename",
          file_status = true,
          newfile_status = false,
          path = 1,
          -- Shortens path to leave 40 spaces in the window
          shorting_target = 40,
          symbols = {
            modified = "(modified)",
            readonly = "(readonly)",
            unnamed = "[No Name]",
            newfile = "[New]",
          },
        },
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
        },
      },
      lualine_x = {
        {
          "filetype",
          colored = true,
          padding = { left = 0, right = 1 },
          icon = { align = "right" },
        },
        {
          "diagnostics",
          sections = { "error", "warn", "info", "hint" },
          diagnostics_color = {
            -- Same values as the general color option can be used here.
            error = "DiagnosticError",
            warn = "DiagnosticWarn",
            info = "DiagnosticInfo",
            hint = "DiagnosticHint",
          },
          symbols = { error = "Err ", warn = "Warn ", info = "Info ", hint = "Hint " },
          colored = true,
          update_in_insert = false,
          always_visible = false,
        },
      },
      lualine_y = { "none" },
      lualine_z = {
        { "fancy_lsp_servers" },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
