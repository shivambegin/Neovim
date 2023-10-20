return {
  {
      'HiPhish/rainbow-delimiters.nvim', -- colorize parentheses
      config = function()
          local rainbow_delimiters = require 'rainbow-delimiters'

          vim.g.rainbow_delimiters = {
              strategy = {
                  [''] = rainbow_delimiters.strategy['global'],
                  vim = rainbow_delimiters.strategy['local'],
              },
              query = {
                  [''] = 'rainbow-delimiters',
                  lua = 'rainbow-blocks',
              },
              highlight = {
                  'RainbowDelimiterRed',
                  'RainbowDelimiterYellow',
                  'RainbowDelimiterBlue',
                  'RainbowDelimiterOrange',
                  'RainbowDelimiterGreen',
                  'RainbowDelimiterViolet',
                  'RainbowDelimiterCyan',
              },
          }
      end,
  },
  {
      'lukas-reineke/indent-blankline.nvim', -- show indent line
      dependencies = 'HiPhish/rainbow-delimiters.nvim', -- Use color from rainbow_delimiters
      main = 'ibl',
      config = function()
          local highlight = {
              'RainbowDelimiterRed',
              'RainbowDelimiterYellow',
              'RainbowDelimiterBlue',
              'RainbowDelimiterOrange',
              'RainbowDelimiterGreen',
              'RainbowDelimiterViolet',
              'RainbowDelimiterCyan',
          }

          -- vim.g.rainbow_delimiters = { highlight = highlight }
          require('ibl').setup({
              -- indent = { char = '│', },
              exclude = {
                  filetypes = {
                      'help', 'startify', 'make', 'NvimTree', 'neo-tree', 'neo-tree-popup',
                      'dashboard', 'lsp-installer', 'alpha', 'packer', 'Outline', 'mason',
                      'dap-float', 'dap-repl', 'dapui_scopes', 'dapui_breakpoints',
                      'dapui_stacks', 'dapui_watches', 'dapui_console', 'norg',
                      'lazy', 'lspinfo', 'null-ls-info', 'noice',
                  },
                  buftypes = {
                      'terminal', 'nofile', 'quickfix', 'prompt',
                  },
              },
              scope = {
                  -- enabled = false,
                  highlight = highlight,
              },
          })

          local hooks = require('ibl.hooks')
          hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
      end,
  },
}
