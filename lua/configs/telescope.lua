local M = {}

function M.config()

  local status_ok, telescope = pcall(require, 'telescope')
  if not status_ok then return end
  local action_set = require('telescope.actions.set')

  telescope.setup(
    {
      pickers = {
        find_files = {
          hidden = true,
          attach_mappings = function(_)
            action_set.select:enhance({post = function() vim.cmd(':normal! zx') end})
            return true
          end,
        },
      },
      defaults = {
        prompt_prefix = '🔍 ',
        selection_caret = '> ',
        entry_prefix = '  ',
        initial_mode = 'insert',
        selection_strategy = 'reset',
        sorting_strategy = 'descending',
        layout_strategy = 'horizontal',
        file_sorter = require('telescope.sorters').get_generic_sorter,
        file_ignore_patterns = {'.git/', 'node_modules', '__snapshots_-'},
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
        color_devicons = true,
        use_less = true,
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require('telescope.previewers').buffer_previewer_maker,
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        },
        file_browser = {
          theme = 'ivy',
          mappings = {
            ['i'] = {
              -- your custom insert mode mappings
            },
            ['n'] = {
              -- your custom normal mode mappings
            },
          },
        },
        project = {
          base_dirs = {'~/workspace', '~/workspace/client', '~/.config/nvim'},
          max_depth = 4,
          hidden_files = true,
        },
      },
    }
  )
end

return M
