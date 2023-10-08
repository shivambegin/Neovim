-- return {
--     {
--         'nvim-neo-tree/neo-tree.nvim',
--         dependencies = {
--             'nvim-lua/plenary.nvim',
--             'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
--             'MunifTanjim/nui.nvim',
--         },
--         cmd = 'Neotree',
--         keys = {
--             {
--                 '<leader>nt',
--                 '<cmd>Neotree toggle<CR>',
--                 desc = 'NeoTree Toggle',
--             },
--         },
--         init = function()
--             vim.g.neo_tree_remove_legacy_commands = 1
--         end,
--         opts = {
--             filesystem = {
--                 follow_current_file = {
--                     enabled = true,
--                 },
--                 hijack_netrw_behavior = 'open_current',
--                 filtered_items = {
--                     never_show = { '.git' },
--                 },
--             },
--             window = {
--                 position = 'right',
--                 width = 30,
--                 mappings = {
--                     ['o'] = 'open',
--                 },
--             },
--         },
--     },
-- }



return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        update_focused_file = {
          enable = true,
          update_cwd = true,
        },
        renderer = {
          root_folder_modifier = ":t",
       -- These icons are visible when you install web-devicons
          icons = {
            glyphs = {
              default = "",
              symlink = "",
              folder = {
                arrow_open = "",
                arrow_closed = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "",
                staged = "S",
                unmerged = "",
                renamed = "➜",
                untracked = "U",
                deleted = "",
                ignored = "◌",
              },
            },
          },
        },
        diagnostics = {
          enable = true,
          show_on_dirs = true,
          icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
          },
        },
        view = {
          width = 30,
          side = "right",
          cursorline = false,
        },
        filters = {
          dotfiles = true,
        },
      })
    end,
}
