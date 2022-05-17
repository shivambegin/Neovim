local M = {}

function M.config()

  vim.g.vim_markdown_folding_disabled = 1
  vim.g.vim_markdown_folding_level = 1
  vim.g.vim_markdown_no_default_key_mappings = 0
  vim.g.vim_markdown_emphasis_multiline = 1
  vim.g.vim_markdown_follow_anchor = 1
  vim.g.vim_markdown_new_list_item_indent = 0
  vim.g.vim_markdown_auto_extension_ext = 'txt'
  vim.g.vim_markdown_auto_insert_bullets = 1

end

return M
