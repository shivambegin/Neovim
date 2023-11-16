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
          -- "CursorLine",
          -- "CursorLineNr",
          --"StatusLine",
          --"StatusLineNC",
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
          "FloatBorder",
          "Search",
        }, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    lazy = false,
    enabled = true,
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "solarized_dark",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
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
          },
        },
        sections = {
          lualine_a = { "buffers" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = {
            {
              function()
                local msg = ""
                local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                  return msg
                end
                for _, client in ipairs(clients) do
                  local filetypes = client.config.filetypes
                  if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                  end
                end
                return msg
              end,
              icon = " ",
            },
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { "filename" },
          lualine_x = { "location" },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {},
      })
    end,
  },
  {
    "b0o/incline.nvim",
    dependencies = { "craftzdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    tag = "legacy",
    config = function()
      require("fidget").setup({
        text = {
          spinner = "meter",
          done = "",
        },
        window = {
          blend = 0, -- set 0 if using transparent background, otherwise set 100
        },
      })
    end,
  },
  {
    "luukvbaal/statuscol.nvim",
    event = "BufReadPre",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        setopt = true,
        separator = "",
        foldfunc = "builtin",
        segments = {
          { text = { "%s" }, click = "v:lua.ScSa" },
          {
            text = { builtin.lnumfunc, " " },
            click = "v:lua.ScLa",
          },
        },
      })
    end,
  },
  {
    "SmiteshP/nvim-navic",
    enabled = true,
    event = "BufReadPre",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-tree/nvim-web-devicons" },
    config = function()
      vim.g.navic_silence = true
      require("nvim-navic").setup({ separator = " › ", highlight = true, depth_limit = 3 })

      -- local theme = require("plugins.theme")
      -- local colors = theme.colors()
      -- if not colors then
      --   return
      -- end
    end,
  },
  {
    "LunarVim/breadcrumbs.nvim",
    enabled = true,
    dependencies = {
      { "SmiteshP/nvim-navic" },
      { "nvim-tree/nvim-web-devicons" },
    },
    config = function()
      require("nvim-navic").setup({
        lsp = {
          auto_attach = true,
        },
      })
      require("breadcrumbs").setup()
    end,
  },
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>zz", "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },
    },
  },
}
