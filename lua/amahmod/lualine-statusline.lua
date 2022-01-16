local lualine = require 'lualine'

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg = '#202328',
  fg = '#bbc2cf',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#98be65',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand '%:t') ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local branch = {'branch', icon = '', color = {fg = colors.fg, gui = 'bold'}}

local diagnostics = {
  'diagnostics',
  sources = {'nvim_diagnostic'},
  sections = {'error', 'warn', 'info'},
  symbols = {error = ' ', warn = ' ', info = ' '},
  -- diagnostics_color = {
  --   color_error = {fg = colors.red},
  --   color_warn = {fg = colors.yellow},
  --   color_info = {fg = colors.blue},
  -- },
  colord = true,
  update_in_insert = false,
  always_visible = false,
}

local filename = {'filename', cond = conditions.buffer_not_empty, color = {fg = colors.magenta, gui = 'bold'}}

local lsp = {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then return client.name end
    end
    return msg
  end,
  icon = ' LSP:',
  color = {fg = '#ffffff', gui = 'bold'},
}

local mode = {'mode', fmt = function(str) return '-- ' .. str .. ' --' end}

local spaces = function() return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth') end

local filetype = {'filetype', icons_enabled = false, icon = nil}

local diff = {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = {added = ' ', modified = '柳 ', removed = ' '},
  diff_color = {added = {fg = colors.green}, modified = {fg = colors.orange}, removed = {fg = colors.red}},
  cond = conditions.hide_in_width,
}

local location = {'location', padding = 0}

-- local encoding = {
--   'o:encoding', -- option component same as &encoding in viml
--   fmt = string.upper, -- I'm not sure why it's upper case either ;)
--   cond = conditions.hide_in_width,
--   color = {fg = colors.green, gui = 'bold'},
-- }

-- local fileformat = {
--   'fileformat',
--   fmt = string.upper,
--   icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
--   color = {fg = colors.green, gui = 'bold'},
-- }

local progress = function()
  local current_line = vim.fn.line('.')
  local total_lines = vim.fn.line('$')
  local chars = {'__', '▁▁', '▂▂', '▃▃', '▄▄', '▅▅', '▆▆', '▇▇', '██'}
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local filesize = {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

local gap = function() return '%=' end

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = {left = '', right = ''},
    section_separators = {left = '', right = ''},
    disabled_filetypes = {'dashboard', 'NvimTree', 'Outline'},
    always_divide_middle = true,
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {branch, diagnostics},
    lualine_b = {filename, filesize, mode},
    lualine_c = {gap, lsp},
    lualine_x = {diff, filetype, spaces},
    lualine_y = {location},
    lualine_z = {progress},
    -- These will be filled later
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

lualine.setup(config)
