return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local cwd = vim.fn.getcwd()

    local cwdLine = string.format("You're in: '%s'", cwd)

    dashboard.section.header.val = {
      [[                                                  ]],
      [[                     H.E.L.L.O.                   ]],
      [[                                                  ]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⣨⣼⣽⣿⣿⣯⣙⣛⠯⣿⣥⣒⡢⢄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡀⣴⣶⣿⡿⠟⠛⠛⠛⠛⠻⡿⣾⣶⣝⣿⣿⣶⣮⣖⣤⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⢪⣾⣿⡟⠉⠀⠀⠀⠀⠀⠀⠀⠰⢉⡛⢿⣯⣿⣾⣷⣻⣾⢿⣮⣕⠦⡀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣡⣿⣿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠐⢿⣯⣿⣷⣿⡽⣿⣳⣿⣻⣬⣦⡀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣸⣿⣿⣇⠀⠀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⡀⠘⢠⢻⣯⣿⣿⣿⣻⢿⣿⣿⣿⣟⡇⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣏⠯⢉⢭⣽⣿⠿⠿⣿⡯⠹⠍⢋⣽⣿⣿⡿⠟⠿⠿⢿⣿⣿⣷⣿⣿⣟⣯⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡗⢤⣪⣾⣿⡿⠈⠀⣿⡧⠁⡔⣾⣿⣿⣿⠰⡉⠈⠃⠘⡰⢈⢿⣷⣿⣿⣿⣿⣾⣿⣿⠏⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣯⣶⣿⣿⠿⢅⣀⠠⢩⢧⣵⣿⣿⣿⣿⡿⣁⠂⠀⠀⠀⠀⠩⢸⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢙⣿⡟⠀⠠⠀⣨⠝⡆⠈⠩⠍⠭⡙⠰⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠋⠀⡀⣽⡟⠁⠊⠷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢼⣿⣽⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠔⠁⢀⠂⡐⠈⡀⠄⡁⢫⢕⡄⠀⠀⠀⠀⠀⠀⠀⠀⢀⠠⡃⢼⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠐⡀⠂⠄⡁⠄⣂⣴⣧⠿⢡⢃⣀⡀⣀⢀⡔⢠⠊⣅⠚⡄⣻⣿⣿⣿⣿⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⢀⠀⣀⠐⢈⠀⠂⠄⣁⢢⣤⣾⣿⣵⣎⡷⢣⡆⡔⠢⡅⠦⡘⢢⠑⢢⡑⢬⣿⣷⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠲⠶⠶⠦⠮⠥⠭⠶⠼⣵⣿⣿⣿⣿⣿⣿⣷⡃⡜⠲⡱⣈⢒⠡⢆⡙⠤⣸⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⡗⠀⠀⠑⠐⣊⠑⡢⠘⣶⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⢿⣿⣿⣿⣿⣿⠣⠁⠀⠀⠀⠀⢩⢰⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⡀⠀⠀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⢇⠱⠀⠀⠀⠀⢀⢴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡜⡟⣿⣾⣄⠀⠀⢀⣴⣷⠛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡠⣳⢹⡇⣿⣿⣿⣆⢠⣾⣿⣿⢈⣿⣿⣿⣿⣿⣿⣿⣿⢿⣻⣽⣻⢿⣿⣿⣿⣿⣿⣆⠀⠀]],
      [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢜⣼⢋⣿⡇⣿⣿⣿⣋⣻⣿⣿⣿⢂⣿⣿⣿⣿⣿⢿⣻⣽⣿⣿⢯⡿⣿⣽⣿⣿⣿⣿⣿⣧⠀]],
      [[                                                  ]],
      cwdLine,
      [[                                                  ]],
    }

    vim.cmd([[highlight AlphaHeader guifg=#eb6f92]])
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.val = {
      dashboard.button("N", "Neorg", ":Neorg index<CR>"),
      dashboard.button("C", "Config", ":e$MYVIMRC | :cd %:p:h | Oil <CR>"),
      dashboard.button("q", "Quit", ":qa<CR>"),
    }

    -- Would be nice if this quote would change every day
    dashboard.section.footer.val = {
      [[                                                        ]],
      [[                                                        ]],
      [[                                                        ]],
      [[ "Don't explain your philosophy. Embody it" - Epictetus ]],
    }

    vim.cmd([[highlight AlphaFooter cterm=italic gui=italic guifg=#6e6a86]])
    dashboard.section.footer.opts.hl = "AlphaFooter"

    alpha.setup(dashboard.config)
  end,
}
