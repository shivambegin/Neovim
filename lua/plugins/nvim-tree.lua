vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged = '',
    staged = 'S',
    unmerged = '',
    renamed = '➜',
    deleted = '',
    untracked = 'U',
    ignored = '◌',
  },
  folder = {default = '', open = '', empty = '', empty_open = '', symlink = ''},
}

vim.g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1, folder_arrows = 1}

require'nvim-tree'.setup {
  ignore_ft_on_setup = {'startify', 'dashboard', 'alpha'},
  update_cwd = true,
  update_to_buf_dir = {enable = true, auto_open = true},
  diagnostics = {enable = true, icons = {hint = '', info = '', warning = '', error = ''}},
  update_focused_file = {enable = true, update_cwd = true, ignore_list = {}},
  filters = {dotfiles = false, custom = {'.git'}},
}
