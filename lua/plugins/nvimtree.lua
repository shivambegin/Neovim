-- indent char from settings
local settings = require("config.chadmaps")

-- disable indent guides if aspect is clean
local enable = true
if settings.aspect == "clean" then
  enable = false
end

-- recommended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- custom setup
return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    view = {
      width = 39,
    },
    renderer = {
      root_folder_label = false, -- hide root directory at the top
      indent_markers = {
        enable = enable, -- folder level guide
        icons = {
          corner = "└",
          edge = settings.indentChar,
          item = settings.indentChar,
          bottom = "─",
          none = " ",
        },
      },
      icons = {
        glyphs = {
          folder = {
            arrow_closed = "",
            arrow_open = "",
            default = "",
            open = "",
            empty = "",
            empty_open = "",
          },
          git = {
            unstaged = "",
            staged = "",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
        padding = " ",
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          enable = false,
        },
      },
    },
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    filters = {
      dotfiles = true,
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
  },
}
