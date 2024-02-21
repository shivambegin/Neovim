-- luacheck: globals vim

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "UiEnter",
  config = function()
    local icons = require("config.lualineIcons")

    local disable = {
      "neogitstatus",
      "netrw",
      "lir",
      "lazy",
      "alpha",
      "Outline",
      "NeogitStatus",
      "NeogitCommitMessage",
    }

    local ignore = { "help", "TelescopePrompt" }

    local function hide_in_width()
      return vim.fn.winwidth(0) > 80
    end

    local space = {
      " ",
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = {
        error = icons.error .. " ",
        warn = icons.warn .. " ",
      },
      colored = false,
      padding = 0,
      update_in_insert = false,
    }

    local diff = {
      "diff",
      colored = false,
      cond = hide_in_width,
    }

    local branch = {
      "branch",
      icon = icons.git,
    }

    local filetype = {
      "filetype",
      icon_only = true,
      colored = false,
      cond = hide_in_width,
    }

    local function lsp_client_names()
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return ""
      end
      local client_names = {}
      for _, client in pairs(clients) do
        table.insert(client_names, client.name)
      end
      return table.concat(client_names, ", ")
    end

    local language_server = {
      lsp_client_names,
    }

    local lsp_progress = {
      "lsp_progress",
      display_components = { { "title", "percentage", "message" } },
      timer = {
        progress_enddelay = 500,
        lsp_client_name_enddelay = 500,
      },
    }

    local opts = {
      options = {
        icons_enabled = true,
        theme = embark,
        component_separators = "",
        section_separators = { left = "", right = " " },
        disabled_filetypes = disable,
        ignore_focus = ignore,
        always_divide_middle = true,
        globalstatus = true,
      },
      sections = {
        lualine_a = { filetype, "filename" },
        lualine_b = { branch },
        lualine_c = { space, diff, diagnostics },
        lualine_x = { lsp_progress, language_server },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      extensions = {},
    }

    require("lualine").setup(opts)
  end,
}
