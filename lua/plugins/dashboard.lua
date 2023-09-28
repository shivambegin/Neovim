return{
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
      theme = 'hyper',
      config = {
        week_header = {
        enable = true,
        },
        shortcut = {
          { desc = '󰊳 init.lua',
            group = '@property',
            action = 'edit C:\\Users\\shiva\\AppData\\Local\\nvim\\init.lua',
            key = 'e'
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Projects',
            group = 'DiagnosticHint',
            action = 'Telescope projects',
            key = 'p',
          },
          {
            desc = ' Oldfiles',
            group = 'Number',
            action = 'Telescope oldfiles',
            key = 'o',
          },
        },
      },
    }
  end,

  dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
