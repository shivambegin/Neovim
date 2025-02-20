-- the bare bone of this statuscolumn plugin is borrowed from: LazyVim:
-- https://github.com/LazyVim/LazyVim
local M = {}

-- highlight groups for the gradual line numbers highlight
vim.api.nvim_set_hl(0, "LineNr0", { fg = "#a6c7e0", bold = true }) -- Current line (light blue)
vim.api.nvim_set_hl(0, "LineNr1", { fg = "#8da6b6" }) -- Lines ±1 (teal)
vim.api.nvim_set_hl(0, "LineNr2", { fg = "#c9b18a" }) -- Lines ±2 (golden brown)
vim.api.nvim_set_hl(0, "LineNr3", { fg = "#8c6a87" }) -- Lines ±3 (muted pink)
vim.api.nvim_set_hl(0, "LineNr4", { fg = "#53546d" }) -- Lines ±4 and beyond (dark purple)

--This code below regarding statuscolumn was borrowed from LazyVim.
--credit to folke/LazyVim https://github.com/LazyVim/LazyVim
-- Returns a list of regular and extmark signs sorted by priority (low to high)
---@alias Sign {name:string, text:string, texthl:string, priority:number}

-- Returns a list of regular and extmark signs sorted by priority (low to high)
---@return Sign[]
---@param buf number
---@param lnum number
function M.get_signs(buf, lnum)
  -- Get regular signs
  ---@type Sign[]
  local signs = {}

  -- Get extmark signs
  local extmarks = vim.api.nvim_buf_get_extmarks(
    buf,
    -1,
    { lnum - 1, 0 },
    { lnum - 1, -1 },
    { details = true, type = "sign" }
  )
  for _, extmark in pairs(extmarks) do
    signs[#signs + 1] = {
      name = extmark[4].sign_hl_group or extmark[4].sign_name or "",
      text = extmark[4].sign_text,
      texthl = extmark[4].sign_hl_group,
      priority = extmark[4].priority,
    }
  end

  -- Sort by priority
  table.sort(signs, function(a, b)
    return (a.priority or 0) < (b.priority or 0)
  end)

  return signs
end

---@return Sign?
---@param buf number
---@param lnum number
function M.get_mark(buf, lnum)
  local marks = vim.fn.getmarklist(buf)
  vim.list_extend(marks, vim.fn.getmarklist())
  for _, mark in ipairs(marks) do
    if mark.pos[1] == buf and mark.pos[2] == lnum and mark.mark:match("[a-zA-Z]") then
      return { text = mark.mark:sub(2), texthl = "DiagnosticHint" }
    end
  end
end

---@param sign? Sign
---@param len? number
function M.icon(sign, len)
  sign = sign or {}
  len = len or 2
  local text = vim.fn.strcharpart(sign.text or "", 0, len) ---@type string
  text = text .. string.rep(" ", len - vim.fn.strchars(text))
  return sign.texthl and ("%#" .. sign.texthl .. "#" .. text .. "%*") or text
end

function M.foldtext()
  local start_line = vim.api.nvim_buf_get_lines(0, vim.v.foldstart - 1, vim.v.foldstart, false)[1]
  local end_line = vim.api.nvim_buf_get_lines(0, vim.v.foldend - 1, vim.v.foldend, false)[1]

  start_line = start_line:gsub("\t", string.rep(" ", vim.bo.tabstop))
  end_line = end_line:gsub("^%s*(.-)%s*$", "%1")

  local fold_length = vim.v.foldend - vim.v.foldstart + 1
  local indent = string.match(start_line, "^%s*")
  local fold_icon = "▼ "
  local fold_info = string.format(" [%d lines] ", fold_length)

  local max_width = vim.api.nvim_win_get_width(0) - #indent - #fold_icon - #fold_info - 5
  local truncated_start = string.sub(start_line, #indent + 1, max_width)
  local truncated_end = string.sub(end_line, -20)

  local fold_line = string.format("%s%s%s...%s%s", indent, fold_icon, truncated_start, truncated_end, fold_info)

  return fold_line
end

-- Add the wrapped line calculation function
local function get_num_wraps(lnum)
  return vim.api.nvim_win_call(0, function()
    local winid = vim.api.nvim_get_current_win()
    local winwidth = vim.api.nvim_win_get_width(winid)
    local numberwidth = vim.wo.number and vim.wo.numberwidth or 0
    local signwidth = vim.fn.exists("*sign_define") == 1 and vim.fn.sign_getdefined() and 2 or 0
    local foldwidth = vim.wo.foldcolumn or 0
    local bufferwidth = winwidth - numberwidth - signwidth - foldwidth - 4

    local line = vim.fn.getline(lnum)
    local line_length = vim.fn.strdisplaywidth(line)
    return math.floor(line_length / bufferwidth)
  end)
end

function M.get_visual_range()
  local start_line = vim.fn.line("v")
  local end_line = vim.fn.line(".")
  -- Swap if selection is made upwards
  if start_line > end_line then
    start_line, end_line = end_line, start_line
  end
  return { start_line, end_line }
end

-- local number_color = require("utils.hi").getHexColor("Constant", "fg")
vim.api.nvim_set_hl(0, "StatusColumnNumber", { link = "Constant" })
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- number_color = require("utils.hi").getHexColor("Visual", "bg")
    vim.api.nvim_set_hl(0, "StatusColumnNumber", { link = "Constant" })
  end,
})

function M.statuscolumn()
  local win = vim.g.statusline_winid
  local buf = vim.api.nvim_win_get_buf(win)
  local is_file = vim.bo[buf].buftype == ""
  local show_signs = vim.wo[win].signcolumn ~= "no"

  -- Components array represents the three parts of the statuscolumn:
  -- [1] = left side (signs/marks)
  -- [2] = middle (line numbers)
  -- [3] = right side (git signs/fold icons)
  local components = { "", "", "" } -- left, middle, right

  if show_signs then
    local signs = M.get_signs(buf, vim.v.lnum)
    ---@type Sign?,Sign?,Sign?
    local left, right, fold
    for _, s in ipairs(signs) do
      if s.name and (s.name:find("GitSign") or s.name:find("MiniDiffSign")) then
        right = s
      else
        left = s
      end
    end

    -- Left: mark or non-git sign
    components[1] = M.icon(M.get_mark(buf, vim.v.lnum) or left)
    -- Right: fold icon or git sign (only if file)
    components[3] = is_file and M.icon(fold or right) or ""
  end

  -- They show when either number or relativenumber is true
  local is_num = vim.wo[win].number
  local is_relnum = vim.wo[win].relativenumber

  if vim.v.virtnum < 0 then
    components[2] = "%=│ " -- Truncated lines
  elseif vim.v.virtnum > 0 and (is_num or is_relnum) then
    local num_wraps = get_num_wraps(vim.v.lnum)
    components[2] = "%=" .. (vim.v.virtnum == num_wraps and "└ " or "├ ") -- Wrapped lines
  elseif is_num or is_relnum then
    local number_component = ""
    local mode = vim.fn.mode()

    -- visual mode highlighting
    if mode:match("[vV]") then
      local v_range = M.get_visual_range()
      local is_in_range = vim.v.lnum >= v_range[1] and vim.v.lnum <= v_range[2]
      if is_in_range then
        number_component = "%#StatusColumnNumber#"
      end
    -- end -- NOTE: to add gradual ln hls comment this line and uncomment the block below
    else
      -- Gradual line number highlighting
      local rel_num = math.abs(vim.v.relnum)
      if vim.v.relnum == 0 then
        number_component = "%#LineNr0#"
      elseif rel_num == 1 then
        number_component = "%#LineNr1#"
      elseif rel_num == 2 then
        number_component = "%#LineNr2#"
      elseif rel_num == 3 then
        number_component = "%#LineNr3#"
      elseif rel_num == 4 then
        number_component = "%#LineNr4#"
      end
    end

    if vim.fn.has("nvim-0.11") == 1 then
      number_component = number_component .. "%l"
    else
      if vim.v.relnum == 0 then
        number_component = number_component .. (is_num and "%l" or "%r")
      else
        number_component = number_component .. (is_relnum and "%r" or "%l")
      end
    end
    components[2] = "%=" .. number_component .. " "
  else
    components[2] = "%= "
  end

  return table.concat(components, "")
end

return M
