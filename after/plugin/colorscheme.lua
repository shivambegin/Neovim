local colorscheme = 'rose-pine'
local transparent_background = true
-- nightfox dayfox dawnfox nordfox duskfox terafox

local setup_nightfox = function()
    local status_ok, nightfox = pcall(require, 'nightfox')
    if not status_ok then
        return
    end
    nightfox.setup {
        options = {
            -- Compiled file's destination location
            compile_path = vim.fn.stdpath 'cache' .. '/nightfox',
            compile_file_suffix = '_compiled', -- Compiled file suffix
            transparent = transparent_background, -- Transparent background
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
end

local setup_rose_pine = function()
    local status_ok, rose_pine = pcall(require, 'rose-pine')
    if not status_ok then
        return
    end
    rose_pine.setup {
        disable_background = transparent_background,
        dark_variant = 'dark', -- dark, moon
        --- @usage string hex value or named color from rosepinetheme.com/palette
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
            warn = 'gold',

            headings = {
                h1 = 'iris',
                h2 = 'foam',
                h3 = 'rose',
                h4 = 'gold',
                h5 = 'pine',
                h6 = 'foam',
            },
            -- or set all headings at once
            -- headings = 'subtle'
        },
        -- Change specific vim highlight groups
        highlight_groups = {
            ColorColumn = { bg = 'rose' },
        },
    }
end

local setup_tokyonight = function()
    local status_ok, tokyonight = pcall(require, 'tokyonight')
    if not status_ok then
        return
    end
    tokyonight.setup {
        style = 'storm', -- storm, moon, night, day
        transparent = transparent_background,
        styles = {
            comments = { italic = true },
            keywords = { italic = true },
            functions = {},
            strings = {},
            variables = {},
            sidebars = 'dark',
            floats = 'dark',
        },
    }
end

if colorscheme == 'nightfox' then
    setup_nightfox()
elseif colorscheme == 'rose-pine' then
    setup_rose_pine()
elseif colorscheme == 'tokyonight' then
    setup_tokyonight()
end

if transparent_background then
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
