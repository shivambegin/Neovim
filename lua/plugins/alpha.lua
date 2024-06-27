return {
  "goolord/alpha-nvim",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    -- Set header
    dashboard.section.header.val = {
      [[                                        ]],
      [[ ██████████████████████████████████████ ]],
      [[ █▄ ▀█▄ ▄█▄ ▄▄ █ ▄▄ █▄ █ ▄█▄ ▄█▄ ▀█▀ ▄█ ]],
      [[ ██ █▄▀ ███ ▄█▀█ ██ ██▄▀▄███ ███ █▄█ ██ ]],
      [[ ▀▄▄▄▀▀▄▄▀▄▄▄▄▄▀▄▄▄▄▀▀▀▄▀▀▀▄▄▄▀▄▄▄▀▄▄▄▀ ]],
      [[                                        ]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("o", "󰊪    File Explorer", ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0), false)<CR>"),
      dashboard.button("f", "    Find File", ":Telescope find_files<CR>"),
      dashboard.button("e", "    Edit Neovim", ":cd ~\\AppData\\Local\\nvim\\<CR>:Telescope find_files<CR>"),
      dashboard.button("q", "    Quit", ":q<CR>"),
    }
    alpha.setup(dashboard.opts)
  end,
}
