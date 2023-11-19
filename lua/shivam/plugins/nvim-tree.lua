local M = {
  "kyazdani42/nvim-tree.lua",
      dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  cmd = "NvimTree",
  keys = {
    {
      "<leader>nt",
      function()
        local api = require("nvim-tree.api")
        api.tree.toggle()
      end,
      desc = "NvimTree (root dir)",
      remap = true,
    },
  },
  lazy = true,
}

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

M.init = function()
  vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
end

M.config = function()
  local status_ok, tree = pcall(require, "nvim-tree")
  if not status_ok then
    return
  end

  tree.setup({
    renderer = {
      special_files = {
        "package.json",
        "README.md",
        "index.js",
        "index.ts",
        "index.tsx",
        "Makefile",
        "Cargo.toml",
      },
      group_empty = true,
      root_folder_modifier = ":t",
      highlight_git = false,
      indent_markers = {
        enable = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          none = " ",
        },
      },
      icons = {
        glyphs = {
          default = "",
          symlink = "",
          git = {
            unstaged = "",
            staged = "",
            renamed = "",
            untracked = "?",
            unmerged = "",
            deleted = "",
            ignored = "◌",
          },
          folder = {
            default = "",
            open = "",
            empty = "",
            empty_open = "",
            symlink = "",
          },
        },
        show = {
          git = false,
          folder = true,
          file = true,
          folder_arrow = true,
        },
      },
    },
    git = {
      enable = true,
      ignore = false,
    },
    disable_netrw = false,
    auto_reload_on_write = true,
    hijack_directories = {
      enable = true,
      auto_open = true,
    },
    update_focused_file = {
      enable = true,
    },
    filters = {
      dotfiles = false,
      custom = {
        "^\\.git",
        "^\\.cache",
        "^\\.DS_Store",
        "__pycache__",
        "^\\.idea",
        "^\\.next",
        "node_modules",
        "^\\.yarn",
        "^\\.husky",
      },
      exclude = {
        "^dist",
      },
    },
    diagnostics = {
      enable = true,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    },
    actions = {
      remove_file = {
        close_window = false,
      },
      open_file = {
        resize_window = true,
        quit_on_open = false,
        window_picker = {
          enable = false,
        },
      },
    },
    view = {
      width = 30,
      side = "right",
      relativenumber = false,
      preserve_window_proportions = true,
      centralize_selection = true,
      cursorline = false,
    },
    filesystem_watchers = {
      enable = true,
    },
    update_cwd = false,
  })
end

return M


-- return {
--     "nvim-tree/nvim-tree.lua",
--     version = "*",
--     lazy = false,
--     dependencies = {
--       "nvim-tree/nvim-web-devicons",
--       "nvim-lua/plenary.nvim",
--       "MunifTanjim/nui.nvim",
--     },
--     keys = {
--       {
--         '<leader>nt',
--         '<cmd>NvimTreeToggle<CR>',
--         desc = 'NvimTreeToggle',
--         },
--       },
--     config = function()
--       require("nvim-tree").setup({
--         sort_by = "case_sensitive",
--         update_focused_file = {
--           enable = true,
--           update_cwd = true,
--         },
--         renderer = {
--           root_folder_modifier = ":t",
--        -- These icons are visible when you install web-devicons
--           icons = {
--             glyphs = {
--               default = "",
--               symlink = "",
--               folder = {
--                 arrow_open = "",
--                 arrow_closed = "",
--                 default = "",
--                 open = "",
--                 empty = "",
--                 empty_open = "",
--                 symlink = "",
--                 symlink_open = "",
--               },
--               git = {
--                 unstaged = "",
--                 staged = "S",
--                 unmerged = "",
--                 renamed = "➜",
--                 untracked = "U",
--                 deleted = "",
--                 ignored = "◌",
--               },
--             },
--           },
--         },
--         diagnostics = {
--           enable = true,
--           show_on_dirs = true,
--           icons = {
--             hint = "",
--             info = "",
--             warning = "",
--             error = "",
--           },
--         },
--         view = {
--           width = 30,
--           side = "right",
--           cursorline = false,
--         },
--         filters = {
--           dotfiles = false,
--           git_ignored = false,
--         },
--       })
--     end,
-- }
