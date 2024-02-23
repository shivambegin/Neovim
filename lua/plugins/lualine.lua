return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Eviline config for lualine
    -- Author: shadmansaleh
    -- Credit: glepnir
    local lualine = require("lualine")

    -- Color table for highlights
    local colors = {
      bg = "#202328",
      fg = "#bbc2cf",
      yellow = "#ECBE7B",
      cyan = "#008080",
      darkblue = "#081633",
      green = "#98be65",
      orange = "#FF8800",
      violet = "#a9a1e1",
      magenta = "#c678dd",
      blue = "#51afef",
      red = "#ec5f67",
      white = "#ffffff",
    }

    local gui = {
      bold = "bold",
      italic = "italic",
    }

    local buffer_not_empty = function()
      return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end
    -- local nvim_tree = function() return vim.fn.winnr() == 1 end
    local nvim_tree = function()
      return not not string.match(vim.fn.expand("%:t"), "NvimTree")
    end
    local check_git_workspace = function()
      local filepath = vim.fn.expand("%:p:h")
      local gitdir = vim.fn.finddir(".git", filepath .. ";")
      return gitdir and #gitdir > 0 and #gitdir < #filepath
    end
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 60
    end

    local conditions = {
      show_filesize = function()
        return buffer_not_empty()
      end,
      show_branch = function()
        return nvim_tree() and check_git_workspace()
      end,
      show_filename = function()
        return buffer_not_empty() and not nvim_tree()
      end,
      show_encoding = function()
        return not nvim_tree() and hide_in_width()
      end,
      show_diff = function()
        return hide_in_width()
      end,
      show_fileformat = function()
        return hide_in_width()
      end,
      show_lsp = function()
        return not nvim_tree()
      end,
      show_location = function()
        return not nvim_tree()
      end,
      show_progress = function()
        return not nvim_tree()
      end,
      show_vim_mode = function()
        return not nvim_tree()
      end,
    }

    local sectionss = {
      border = {
        function()
          return "▊"
        end,
        color = { fg = colors.blue, gb = colors.blue }, -- Sets highlighting of component
        padding = 0, -- We don't need space before this
      },
      filename = {
        "filename",
        cond = conditions.show_filename,
        color = { gui = gui.italic },
      },
      vim_mode = {
        function()
          return ""
        end,
        cond = conditions.show_vim_mode,
        left_padding = 0,
      },
      location = {
        "location",
        cond = conditions.show_location,
      },
      progress = {
        "progress",
        cond = conditions.show_progress,
      },
      diagnostics = {
        "diagnostics",
        sources = { "nvim_lsp" },
        symbols = { error = " ", warn = " ", info = " " },
        color_error = colors.red,
        color_warn = colors.yellow,
        color_info = colors.cyan,
      },
      lsp_status = {
        function()
          local msg = "No Active Lsp"
          local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
          local clients = vim.lsp.get_clients()
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
        icon = " LSP:",
        color = { fg = colors.white, gui = gui.bold },
        cond = conditions.show_lsp,
      },
      branch = {
        "branch",
        icon = "",
        cond = conditions.show_branch,
        color = { fg = colors.violet, gui = gui.bold },
      },
      filesize = {
        -- filesize component
        function()
          local function format_file_size(file)
            local size = vim.fn.getfsize(file)
            if size <= 0 then
              return ""
            end
            local sufixes = { "b", "k", "m", "g" }
            local i = 1
            while size > 1024 do
              size = size / 1024
              i = i + 1
            end
            return string.format("%.1f%s", size, sufixes[i])
          end
          local file = vim.fn.expand("%:p")
          if string.len(file) == 0 then
            return ""
          end
          return format_file_size(file)
        end,
        cond = conditions.show_filesize,
        color = { gui = gui.bold },
      },
      encoding = {
        "o:encoding", -- option component same as &encoding in viml
        upper = true, -- I'm not sure why it's upper case either ;)
        cond = conditions.show_encoding,
        color = { fg = colors.green, gui = gui.bold },
      },
      fileformat = {
        "fileformat",
        upper = true,
        icons_enabled = true,
        color = { fg = colors.blue, gui = gui.bold },
        cond = conditions.show_fileformat,
      },
      diff = {
        "diff",
        -- Is it me or the symbol for modified us really weird
        symbols = { added = "", modified = "柳", removed = "" },
        color_added = colors.green,
        color_modified = colors.orange,
        color_removed = colors.red,
        cond = conditions.show_diff,
      },
      space = {
        function()
          return "%="
        end,
      },
    }

    -- Config
    local config = {
      options = {
        -- Disable sectionss and component separators
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.red, bg = colors.bg } },
          insert = { c = { fg = colors.green, bg = colors.bg } },
          visual = { c = { fg = colors.blue, bg = colors.bg } },
          replace = { c = { fg = colors.yellow, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.black } },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          sectionss.border,
          sectionss.branch,
          sectionss.vim_mode,
          sectionss.filename,
          sectionss.location,
          sectionss.progress,
        },
        lualine_x = {
          sectionss.filesize,
          sectionss.encoding,
          sectionss.fileformat,
        },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          sectionss.border,
          sectionss.filename,
          sectionss.branch,
        },
        lualine_x = {
          sectionss.lsp_status,
          sectionss.filesize,
          sectionss.encoding,
          sectionss.fileformat,
          sectionss.diff,
        },
        lualine_y = {},
        lualine_z = {},
      },
    }

    -- Now don't forget to initialize lualine
    lualine.setup(config)
  end,
}
