-- -------------------------
-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
-- MIT license, see LICENSE for more details.
-- -------------------------


-- -------------------------
-- Custom Kanagawa themed colors
-- Reformatted sections
-- -------------------------

-- stylua: ignore
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    local colors = {
      bg = '#1f1f28',           -- sumiInk
      fg = '#dcd7ba',           -- foam
      blue = '#7fb4ca',         -- springBlue
      darkblue = '#223249',     -- waveBlue
      yellow = '#e0af68',       -- springYellow
      pink = '#d27e99',         -- sakuraPink
      transparentbg = nil,
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
    }

    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.fg, bg = colors.transparentbg } },
          inactive = { c = { fg = colors.fg, bg = colors.transparentbg} },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }

    local function ins_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function ins_right(component)
      table.insert(config.sections.lualine_x, component)
    end
            local function get_lsp_client(_)
            ---@type any?{}
            local client_names = {}
            local msg = 'No Active Lsp'
            local clients = vim.lsp.get_clients { bufnr = 0 }
            if next(clients) == nil then return msg end
            for _, client in ipairs(clients) do
                table.insert(client_names, client.name)
            end
            return #client_names == 0 and msg or table.concat(client_names, ' | ')
        end

    -- left
    ins_left {
      function()
        return '▊'
      end,
      color = { fg = colors.yellow},
      padding = { left = 0, right = 1 },
    }

    ins_left {
      'mode',
      color = function()
        local mode_color = {
          n = colors.pink,
          i = colors.yellow,
          v = colors.blue,
          [''] = colors.blue,
          V = colors.blue,
        }
        return { fg = mode_color[vim.fn.mode()] or colors.pink }
      end,
      padding = { right = 1 }
    }

    ins_left { 'location' }

    ins_left {
      'filename',
      cond = conditions.buffer_not_empty,
      newfile_status = true, path = 1 ,
      color = { fg = colors.yellow, gui = 'bold' },
    }

    ins_left {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      symbols = {  error = ' ', warn = ' ', info = '󰋽' },
      diagnostics_color = {
        error = { fg = colors.pink },
        warn = { fg = colors.yellow },
        info = { fg = colors.blue },
      },
    }

    -- right
    -- ins_right {
    --   'fileformat',
    --   fmt = string.upper,
    --   icons_enabled = true,
    --   color = { fg = colors.yellow, gui = 'bold' },
    -- }

    -- ins_right { 'filetype' }

    -- ins_right {
    --   'progress',
    --   color = { fg = colors.fg, gui = 'bold' }
    -- }


    ins_right {
      get_lsp_client, icon = '' ,
      color = { fg = colors.blue, gui = 'bold' }
    }

    ins_right {
      'branch',
      icon = '',
      color = { fg = colors.pink, gui = 'bold' },
    }
    ins_right {
      function()
        return '▊'
      end,
      color = { fg = colors.yellow},
      padding = { left = 1 },
    }

    require('lualine').setup(config)
  end
}
