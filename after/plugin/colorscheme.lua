local settings = require 'amahmod.core.settings'
local colorscheme = 'nightfox'
-- nightfox dayfox dawnfox nordfox duskfox terafox

local ok, nightfox = pcall(require, 'nightfox')
if not ok then
    return
end

nightfox.setup {
    options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath 'cache' .. '/nightfox',
        compile_file_suffix = '_compiled', -- Compiled file suffix
        transparent = settings.transparent_background, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = true, -- Non focused panes set to alternative background
        styles = { -- Style to be applied to different syntax groups
            comments = 'italic', -- Value is any valid attr-list value `:help attr-list`
            conditionals = 'italic',
            constants = 'italic,bold',
            functions = 'italic,bold',
            keywords = 'italic',
            numbers = 'NONE',
            operators = 'bold',
            strings = 'NONE',
            types = 'italic',
            variables = 'NONE',
        },
        inverse = { -- Inverse highlight for different types
            match_paren = false,
            visual = false,
            search = false,
        },
        modules = {},
    },
    palettes = {},
    specs = {},
    groups = {},
}

if settings.transparent_background then
    vim.cmd [[
  hi Normal guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  ]]
end

local colorscheme_loaded, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not colorscheme_loaded then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
