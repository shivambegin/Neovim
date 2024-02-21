local cmp = {} -- statusline components
local hi_pattern = "%%#%s#%s%%*"

function _G._statusline_component(name)
  return cmp[name]()
end

function cmp.diagnostic_status()
  local ok = "[  ]"

  local ignore = {
    ["c"] = true, -- command mode
    ["t"] = true, -- terminal mode
  }

  local mode = vim.api.nvim_get_mode().mode

  if ignore[mode] then
    return ok
  end

  local levels = vim.diagnostic.severity
  local errors = #vim.diagnostic.get(0, { severity = levels.ERROR })
  if errors > 0 then
    return " ✘ "
  end

  local warnings = #vim.diagnostic.get(0, { severity = levels.WARN })
  if warnings > 0 then
    return " ▲ "
  end

  return ok
end

function cmp.position()
  return hi_pattern:format("Search", " %3l:%-2c ")
end

local statusline = {
  '%{%v:lua._statusline_component("diagnostic_status")%} ',
  "%t",
  "%r",
  "%m",
  "%=",
  "%{&filetype} ",
  " %2p%% ",
}

vim.o.statusline = table.concat(statusline, "")
