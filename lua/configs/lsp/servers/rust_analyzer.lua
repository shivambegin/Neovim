local lsp_handlers = require 'configs.lsp.handlers'
local M = {}
local rust_tools = require 'rust-tools'

function M.setup()
  local opts = {

    tools = {
      on_initialized = function()
        vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufEnter', 'CursorHold', 'InsertLeave' }, {
          pattern = { '*.rs' },
          callback = function()
            vim.lsp.codelens.refresh()
          end,
        })
      end,
      inlay_hints = {
        parameter_hints_prefix = ' ',
        other_hints_prefix = ' ',
      },
    },
    server = {
      on_attach = lsp_handlers.on_attach,
      capabilities = lsp_handlers.capabilities,
      settings = {
        ['rust-analyzer'] = {
          lens = {
            enable = true,
          },
          checkOnSave = {
            command = 'clippy',
          },
        },
      },
    },
  }

  rust_tools.setup(opts)
end

return M
