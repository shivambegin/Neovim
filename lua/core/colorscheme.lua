local transparent_background = false
local colorscheme = 'rose-pine'

-- tokyonight
-- vim.g.tokyonight_style = 'night'
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_italic_comments = true
-- vim.g.tokyonight_italic_keywords = true
-- vim.g.tokyonight_italic_variables = true
-- vim.g.tokyonight_sidebars = {'qf', 'vista_kind', 'terminal', 'packer'}
-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = transparent_background
-- vim.g.tokyonight_transparent = false
-- vim.g.tokyonight_hide_inactive_statusline = false
-- vim.g.tokyonight_colors = {hint = 'orange', error = '#ff0000'}

-- Nord
-- https://github.com/shaunsingh/nord.nvim
-- vim.g.nord_contrast = true
-- vim.g.nord_borders = true
-- vim.g.nord_disable_background = false
-- vim.g.nord_italic = true

-- Rose pine
require('rose-pine').setup(
  {
    ---@usage 'main'|'moon'
    dark_variant = 'moon',
    bold_vert_split = true,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,
    ---@usage string hex value or named color from rosepinetheme.com/palette
    groups = {
      background = 'base',
      panel = 'surface',
      border = 'highlight_med',
      comment = 'muted',
      link = 'iris',
      punctuation = 'subtle',

      error = 'love',
      hint = 'iris',
      info = 'foam',
      warn = 'rose',

      headings = {h1 = 'iris', h2 = 'foam', h3 = 'rose', h4 = 'gold', h5 = 'pine', h6 = 'foam'},
      -- or set all headings at once
      -- headings = 'subtle'
    },
    -- Change specific vim highlight groups
    highlight_groups = {ColorColumn = {bg = 'rose'}},
  }
)

if transparent_background then
  vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  ]]
end

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end
