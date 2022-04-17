local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then return end

configs.setup {
  ensure_installed = 'all', -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = {''}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = {''}, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = {enable = true, disable = {'yaml'}},
  autotag = {enable = true},
  autopairs = {enable = true},
  matchup = {enable = true},
  context_commentstring = {enable = true, enable_autocmd = false},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
  refactor = {
    highlight_definitions = {enable = true},
    highlight_current_scope = {enable = false},
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = 'gnd',
        list_definitions = 'gnD',
        list_definitions_toc = 'gO',
        goto_next_usage = '<a-*>',
        goto_previous_usage = '<a-#>',
      },
    },
  },
  textobjects = {
    swap = {enable = true, swap_next = {[']s'] = '@parameter.inner'}, swap_previous = {['[s'] = '@parameter.inner'}},
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {[']m'] = '@function.outer', [']]'] = '@class.outer', [']a'] = '@parameter.inner'},
      goto_next_end = {[']M'] = '@function.outer', [']['] = '@class.outer', [']A'] = '@parameter.inner'},
      goto_previous_start = {['[m'] = '@function.outer', ['[['] = '@class.outer', ['[a'] = '@parameter.inner'},
      goto_previous_end = {['[M'] = '@function.outer', ['[]'] = '@class.outer', ['[A'] = '@parameter.inner'},
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      peek_definition_code = {['<leader>df'] = '@function.outer', ['<leader>dF'] = '@class.outer'},
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
  },
}
