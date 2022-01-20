local transparent_background = false
local colorscheme = 'tokyonight'

-- tokyonight
vim.g.tokyonight_style = 'dark'
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_variables = true
vim.g.tokyonight_sidebars = {'qf', 'vista_kind', 'terminal', 'packer'}
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline = false
vim.g.tokyonight_colors = {hint = 'orange', error = '#ff0000'}

-- oceanic next
vim.g.oceanic_next_terminal_bold = 1
vim.g.oceanic_next_terminal_italic = 1

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
