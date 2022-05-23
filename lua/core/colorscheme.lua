local transparent_background = false
local colorscheme = 'everforest'

-- tokyonight
-- vim.g.tokyonight_style = 'storm' -- night,day,storm
-- vim.g.tokyonight_terminal_colors = true
-- vim.g.tokyonight_italic_comments = true
-- vim.g.tokyonight_italic_keywords = true
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_italic_variables = true
-- vim.g.tokyonight_transparent = transparent_background
-- vim.g.tokyonight_hide_inactive_statusline = false
-- vim.g.tokyonight_sidebars = {'qf', 'vista_kind', 'terminal', 'packer'}
-- vim.g.tokyonight_transparent_sidebar = false
-- vim.g.tokyonight_dark_sidebar = true
-- vim.g.tokyonight_dark_float = true
-- vim.g.tokyonight_colors = {hint = 'orange', error = '#ff0000'}
-- vim.g.tokyonight_day_brightness = 0.2

-- everforest

vim.g.everforest_background = 'soft'
vim.g.everforest_better_performance = 1
vim.g.everforest_enable_italic = 1
vim.g.everforest_disable_italic_comment = 0
vim.g.everforest_diagnostic_text_highlight = 1
vim.g.everforest_diagnostic_line_highlight = 0
vim.g.everforest_diagnostic_virtual_text = 'colored' -- grey, colored
-- vim.g.everforest_current_word = 'grey bakcground' -- bold, underline, italic, grey background

vim.g.everforest_cursor = 'auto' -- auto,red,orange,yellow,'green,aqua,blue,purple'
vim.g.everforest_transparent_background = 0 -- 0,1,2
vim.g.everforest_sign_column_background = 'default' -- default, none
vim.g.everforest_spell_foreground = 'none' -- none, colored
vim.g.everforest_ui_contrast = 'low' -- low, high
vim.g.everforest_show_eob = 1

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
