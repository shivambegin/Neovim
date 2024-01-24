--inspired from https://github.com/serenevoid/nvim/tree/master

local git = require("config.custom-components.git")

local function gen_section(items)
  local out = ""
  local bracket_left = "["
  local bracket_right = "]"
  local padding = " "
  for _, item in pairs(items) do
    if item ~= "" and item ~= nil then
      if out == "" then
        out = "" .. item
      else
        out = out .. " " .. item
      end
    else
      bracket_left = ""
      bracket_right = ""
      padding = ""
    end
  end
  return bracket_left .. out .. bracket_right .. padding
end

-- sensibly group the vim modes
local function get_mode_group(m)
  local mode_groups = {
    n = "Normal",
    no = "Nop",
    nov = "Nop",
    noV = "Nop",
    ["noCTRL-V"] = "Nop",
    niI = "Normal",
    niR = "Normal",
    niV = "Normal",
    v = "Visual",
    V = "Visual",
    ["CTRL-V"] = "Visual",
    s = "Select",
    S = "Select",
    ["CTRL-S"] = "Select",
    i = "Insert",
    ic = "Insert",
    ix = "Insert",
    R = "Rplace",
    Rc = "Rplace",
    Rv = "Rplace",
    Rx = "Rplace",
    c = "Cmmand",
    cv = "Cmmand",
    ce = "Cmmand",
    r = "Prompt",
    rm = "Prompt",
    ["r?"] = "Prompt",
    ["!"] = "Shell",
    t = "Termnl",
    ["null"] = "None",
  }
  return mode_groups[m] or "None"
end

-- get the display name for the group
local function get_mode_group_display_name(mg)
  return mg:upper()
end

-- whether the file has been modified
local function is_modified()
  if vim.bo.modified then
    if vim.bo.readonly then
      return "-"
    end
    return "+"
  end
  return ""
end

-- whether the file is read-only
local function is_readonly()
  if vim.bo.readonly then
    return "RO"
  end
  return ""
end

local function get_file_icon()
  return require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype, { default = true })
end

local function process_diagnostics(prefix, n)
  local out = prefix .. n
  return out
end

local function get_lsp_diagnostics(bufnr)
  local result = {}
  local levels = {
    errors = vim.diagnostic.severity.ERROR,
    warnings = vim.diagnostic.severity.WARN,
    info = vim.diagnostic.severity.INFO,
    hints = vim.diagnostic.severity.HINT,
  }
  for k, level in pairs(levels) do
    result[k] = #vim.diagnostic.get(bufnr, { severity = level })
  end
  return result
end

local function setup_diagnostics()
  local diagnostics = get_lsp_diagnostics()
  local errors = diagnostics.errors
  local warnings = diagnostics.warnings
  if errors == 0 and warnings == 0 then
    return ""
  else
    return table.concat({
      process_diagnostics(" ", errors),
      process_diagnostics("  ", warnings),
    })
  end
end

function Status_line()
  local mode = vim.fn.mode()
  local mg = get_mode_group(mode)

  return table.concat({
    gen_section({ get_mode_group_display_name(mg) }),
    gen_section({ git.get_branch() or "" }),
    "%=",
    gen_section({ is_readonly(), get_file_icon(), "%t", is_modified() }),
    "%=",
    gen_section({ setup_diagnostics() }),
    gen_section({ vim.bo.filetype }),
  })
end
vim.o.statusline = "%!luaeval('Status_line()')"
vim.o.laststatus = 3
