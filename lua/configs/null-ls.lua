local ok, null_ls = pcall(require, 'null-ls')

if not ok then return end

local with_root_file = function(...)
  local files = {...}
  return function(utils) return utils.root_has_file(files) end
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local M = {}
M.config = function(on_attach)
  null_ls.setup {
    sources = {
      diagnostics.eslint_d.with {condition = with_root_file {'.eslintrc', '.eslintrc.js', '.eslintrc.json'}},
      -- diagnostics.markdownlint,
      diagnostics.yamllint,

      formatting.prettierd.with {extra_filetypes = {'svelte'}},
      formatting.lua_format,
      formatting.gofmt,

      code_actions.eslint_d.with {condition = with_root_file {'.eslintrc', '.eslintrc.js', '.eslintrc.json'}},
      code_actions.gitsigns,
    },
    on_attach = on_attach,
  }
end

return M
