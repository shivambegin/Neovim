local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then return end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup(
  {
    debug = false,
    sources = {
      -- Formatting
      formatting.lua_format,
      formatting.prettierd.with({filetypes = {'html', 'css', 'scss', 'less', 'svelte', 'markdown', 'json', 'jsonc'}}),
      formatting.eslint_d.with({filetypes = {'svelte'}, args = {'--stdin', '--stdin-filepath', '$FILENAME'}}),
      -- Diagnostic
      diagnostics.eslint_d.with({filetypes = {'svelte'}, command = 'eslint_d'}), -- An absurdly fast linter
      diagnostics.yamllint,
      diagnostics.markdownlint,
    },
  }
)
