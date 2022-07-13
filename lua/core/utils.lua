local Job = require 'plenary.job'
local M = {}

M.user_terminals = {}

function M.add_cmp_source(source, priority)
  if type(priority) ~= 'number' then
    priority = 1000
  end

  if priority == nil then
    priority = ({ luasnip = 1000, nvim_lsp = 900, buffer = 500, path = 250 })[source]
  end

  local cmp_avail, cmp = pcall(require, 'cmp')
  if cmp_avail then
    local config = cmp.get_config()
    table.insert(config.sources, { name = source, priority = priority })
    cmp.setup(config)
  end
end

-- term_details can be either a string for just a command or
-- a complete table to provide full access to configuration when calling Terminal:new()
function M.toggle_term_cmd(term_details)
  if type(term_details) == 'string' then
    term_details = { cmd = term_details, hidden = true }
  end
  local cmd = term_details.cmd
  if M.user_terminals[cmd] == nil then
    M.user_terminals[cmd] = require('toggleterm.terminal').Terminal:new(term_details)
  end
  M.user_terminals[cmd]:toggle()
end

M.toggle_qf = function()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win['quickfix'] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
    vim.cmd 'cclose'
    return
  end
  vim.cmd 'copen'
  -- only open if the list is not empty
  -- if not vim.tbl_isempty(vim.fn.getqflist()) then
  --   vim.cmd "copen"
  -- end
end

function M.vim_opts(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

function M.get_os_command_output(cmd, cwd)
  if type(cmd) ~= 'table' then
    print 'Utils: [get_os_command_output]: cmd has to be a table'
    return {}
  end
  local command = table.remove(cmd, 1)
  local stderr = {}
  local stdout, ret = Job
      :new({
        command = command,
        args = cmd,
        cwd = cwd,
        on_stderr = function(_, data)
          table.insert(stderr, data)
        end,
      })
      :sync()
  return stdout, ret, stderr
end

---Filters diagnostigs leaving only the most severe per line.
---@param diagnostics table[]
---@return table[]
---@see https://www.reddit.com/r/neovim/comments/mvhfw7/can_built_in_lsp_diagnostics_be_limited_to_show_a/gvd8rb9/
---@see https://github.com/neovim/neovim/issues/15770
---@see https://github.com/akinsho/dotfiles/blob/d3526289627b72e4b6a3ddcbfe0411b5217a4a88/.config/nvim/plugin/lsp.lua#L83-L132
---@see `:h diagnostic-handlers`
M.filter_diagnostics = function(diagnostics)
  if not diagnostics then
    return {}
  end

  -- find the "worst" diagnostic per line
  local most_severe = {}
  for _, cur in pairs(diagnostics) do
    local max = most_severe[cur.lnum]

    -- higher severity has lower value (`:h diagnostic-severity`)
    if not max or cur.severity < max.severity then
      most_severe[cur.lnum] = cur
    end
  end

  -- return list of diagnostics
  return vim.tbl_values(most_severe)
end

function M.isempty(s)
  return s == nil or s == ''
end

function M.get_buf_option(opt)
  local status_ok, buf_option = pcall(vim.api.nvim_buf_get_option, 0, opt)
  if not status_ok then
    return nil
  else
    return buf_option
  end
end

return M
