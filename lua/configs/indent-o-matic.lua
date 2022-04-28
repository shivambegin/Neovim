local M = {}

function M.config()
  local present, indent_o_matic = pcall(require, 'indent-o-matic')
  if not present then return end

  indent_o_matic.setup {max_lines = 2048, standard_widths = {2, 4, 8}}
end

return M
