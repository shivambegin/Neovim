local transparent_background = false
local colorscheme = 'catppuccin' -- catppuccin

-- catppuccin

vim.g.catppuccin_flavour = 'macchiato' -- latte, frappe, macchiato, mocha

require('catppuccin').setup {
  transparent_background = transparent_background,
  compile = {
    enabled = true,
    path = vim.fn.stdpath 'cache' .. '/catppuccin',
  },
  dim_inactive = {
    enabled = false,
    shade = 'dark',
    percentage = 0.15,
  },
  styles = {
    comments = { 'italic' },
    conditionals = { 'italic' },
    loops = {},
    functions = { 'bold' },
    keywords = { 'italic' },
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    -- For various plugins integrations see https://github.com/catppuccin/nvim#integrations
  },
  color_overrides = {},
  highlight_overrides = {},
}

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
