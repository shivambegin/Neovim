local M = {}

function M.config()

  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_tab_fallback = ''

  vim.cmd('imap <silent><script><expr> <C-j> copilot#Accept("")')

end

return M
