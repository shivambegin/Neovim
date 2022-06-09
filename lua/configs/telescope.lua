local M = {}

function M.config()
  local status_ok, telescope = pcall(require, 'telescope')
  if not status_ok then return end

  local actions = require 'telescope.actions'

  local notify_present, _ = pcall(require, 'notify')
  if notify_present then telescope.load_extension 'notify' end

  telescope.setup {
    defaults = {

      prompt_prefix = ' ',
      selection_caret = '❯ ',
      path_display = {'truncate'},
      selection_strategy = 'reset',
      sorting_strategy = 'ascending',
      layout_strategy = 'horizontal',
      layout_config = {
        horizontal = {prompt_position = 'top', preview_width = 0.55, results_width = 0.8},
        vertical = {mirror = false},
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },

      mappings = {
        i = {
          ['<C-n>'] = actions.cycle_history_next,
          ['<C-p>'] = actions.cycle_history_prev,

          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,

          ['<C-c>'] = actions.close,

          ['<Down>'] = actions.move_selection_next,
          ['<Up>'] = actions.move_selection_previous,

          ['<CR>'] = actions.select_default,
          ['<C-x>'] = actions.select_horizontal,
          ['<C-v>'] = actions.select_vertical,
          ['<C-t>'] = actions.select_tab,

          ['<C-u>'] = actions.preview_scrolling_up,
          ['<C-d>'] = actions.preview_scrolling_down,

          ['<PageUp>'] = actions.results_scrolling_up,
          ['<PageDown>'] = actions.results_scrolling_down,

          ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
          ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
          ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
          ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
          ['<C-l>'] = actions.complete_tag,
        },

        n = {
          ['<esc>'] = actions.close,
          ['<CR>'] = actions.select_default,
          ['<C-x>'] = actions.select_horizontal,
          ['<C-v>'] = actions.select_vertical,
          ['<C-t>'] = actions.select_tab,

          ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
          ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
          ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
          ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,

          ['j'] = actions.move_selection_next,
          ['k'] = actions.move_selection_previous,
          ['H'] = actions.move_to_top,
          ['M'] = actions.move_to_middle,
          ['L'] = actions.move_to_bottom,

          ['<Down>'] = actions.move_selection_next,
          ['<Up>'] = actions.move_selection_previous,
          ['gg'] = actions.move_to_top,
          ['G'] = actions.move_to_bottom,

          ['<C-u>'] = actions.preview_scrolling_up,
          ['<C-d>'] = actions.preview_scrolling_down,

          ['<PageUp>'] = actions.results_scrolling_up,
          ['<PageDown>'] = actions.results_scrolling_down,
        },
      },
    },
    pickers = {help_tags = {preview = true, layout_config = {height = 0.8, width = 0.8}}},
    extensions = {},
  }
end

function M.edit_neovim()
  require('telescope.builtin').find_files {
    prompt_title = ' Neovim configs',
    path_display = {'smart'},
    cwd = '~/.config/nvim/',
    layout_strategy = 'horizontal',
    layout_config = {preview_width = 0.65, width = 0.75},
  }
end

function M.find_notes()
  require('telescope.builtin').find_files {
    prompt_title = ' Find Notes',
    path_display = {'smart'},
    cwd = '~/Dropbox/notes/',
    layout_strategy = 'horizontal',
    layout_config = {preview_width = 0.65, width = 0.75},
  }
end

function M.grep_notes()
  local opts = {}
  opts.hidden = true
  opts.search_dirs = {'~/Dropbox/notes/'}
  opts.prompt_prefix = '   '
  opts.prompt_title = ' Grep Notes'
  opts.path_display = {'smart'}
  require('telescope.builtin').live_grep(opts)
end

return M
