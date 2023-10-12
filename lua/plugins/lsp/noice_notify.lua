-- UI improvement for messages, cmdline, and popupmenu
return {
  {
      -- Noice
      'folke/noice.nvim',
      dependencies = 'MunifTanjim/nui.nvim', -- UI Component Library for Neovim
      config = function()
          require('noice').setup({
              -- Turn off cmdline, messages, popupmenu, and notify for the default behavior
              -- cmdline = { enabled = false, },
              -- messages = { enabled = false, },
              -- popupmenu = { enabled = false, },
              -- notify = { enabled = false, },
              -- Setup LSP for prettier rendering
              lsp = {
                  progress = {
                      enabled = true,
                  },
                  override = {
                      -- override the default lsp markdown formatter with Noice
                      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                      -- override the lsp markdown formatter with Noice
                      ['vim.lsp.util.stylize_markdown'] = true,
                      -- override cmp documentation with Noice (needs the other options to work)
                      ['cmp.entry.get_documentation'] = true,
                  },
                  -- Let nvim-cmp handle hover and signature
                  hover = {
                      enabled = false,
                  },
                  signature = {
                      enabled = false,
                  },
                  message = {
                      enabled = true,
                  },
              },
              messages = {
                  enabled = true,
                  view_search = false,
              },
              routes = {
                  {
                      -- Skip all lsp progress contain the word 'Checking document'
                      filter = { event = 'lsp', kind = 'progress', find = 'Checking document', },
                      opts = { skip = true, },
                  },
              },
          })
          vim.api.nvim_set_hl(0, 'NormalFloat', { ctermbg = nil })
      end
  },
  -- Notify
  {
      'rcarriga/nvim-notify', -- A fancy, configurable, notification manager
      config = function()
          require('notify').setup({
              top_down = false,
          })

          local map = function(mode, lhs, rhs, desc)
              local opts = { noremap = true, silent = true, desc = 'DAP: ' .. desc }
              vim.keymap.set(mode, lhs, rhs, opts)
          end
          map('n', '<leader>n', function() require('notify').dismiss() end, 'Dismiss current notify message')
      end,
  },
}
