local transparent_background = false
local colorscheme = 'tokyonight'

-- tokyonight
vim.g.tokyonight_style = 'storm' -- night,day,storm
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_variables = true
vim.g.tokyonight_transparent = transparent_background
vim.g.tokyonight_hide_inactive_statusline = false
vim.g.tokyonight_sidebars = {'qf', 'vista_kind', 'terminal', 'packer'}
vim.g.tokyonight_transparent_sidebar = false
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = {hint = 'orange', error = '#ff0000'}
vim.g.tokyonight_day_brightness = 0.2

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
