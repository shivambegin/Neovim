_G.statusline = {}

---Total rewrite of highlight function. Thanks to @MariaSolOs for the original idea.
---Keeps track of the highlight groups I've already created.
---@type table
statusline.highlight_definitions = {}

---@param name string
---@param hl_or_color string
---@param color_type? "bg"|"fg"
---@param bold? boolean
---@return string
function statusline.define_highlight(name, hl_or_color, color_type, bold)
  local hl_name = "Statusline" .. name

  statusline.highlight_definitions[hl_name] = {
    name = name,
    hl_or_color = hl_or_color,
    color_type = color_type,
    bold = bold,
  }

  statusline.create_or_update_hl(hl_name, statusline.highlight_definitions[hl_name])

  return hl_name
end

-- Function to create or update a highlight
function statusline.create_or_update_hl(hl_name, def)
  local bg_hl = vim.api.nvim_get_hl(0, { name = "StatusLine" })
  local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
  local fg_color

  if def.hl_or_color:sub(1, 1) == "#" then
    fg_color = def.hl_or_color
  else
    local src_hl = vim.api.nvim_get_hl(0, { name = def.hl_or_color })
    ---@diagnostic disable-next-line: undefined-field
    if src_hl.link then -- handle highlight links
      ---@diagnostic disable-next-line: undefined-field
      src_hl = vim.api.nvim_get_hl(0, { name = src_hl.link })
    end
    local color_key = (def.color_type == "bg") and "bg" or "fg"
    fg_color = ("#%06x"):format(src_hl[color_key] or normal_hl[color_key])
  end

  vim.api.nvim_set_hl(0, hl_name, {
    bg = (bg_hl.bg ~= nil) and ("#%06x"):format(bg_hl.bg) or normal_hl.bg,
    fg = fg_color,
    bold = def.bold or false,
  })
end

-- Function to reload all defined highlights
function statusline.reload_highlights()
  for hl_name, def in pairs(statusline.highlight_definitions) do
    statusline.create_or_update_hl(hl_name, def)
  end
end

-- Function to setup the module
function statusline.init()
  -- Set up autocommand to reload highlights on colorscheme change
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = vim.api.nvim_create_augroup("StatuslineHighlightReload", { clear = true }),
    callback = statusline.reload_highlights,
  })
end

-- Function to get the current mode text
---@return string
local function get_mode()
  local modes = {
    -- stylua: ignore start
    ["n"]      = "NO",
    ["no"]     = "OP",
    ["nov"]    = "OC",
    ["noV"]    = "OL",
    ["no\x16"] = "OB",
    ["nt"]     = "NT",
    ["ntT"]    = "TM",
    ["v"]      = "VI",
    [""]     = "I",
    ["V"]      = "VL",
    ["s"]      = "SE",
    ["S"]      = "SL",
    ["\x13"]   = "SB",
    ["i"]      = "IN",
    ["ic"]     = "IC",
    ["ix"]     = "IX",
    ["R"]      = "RE",
    ["Rc"]     = "RC",
    ["Rx"]     = "RX",
    ["Rv"]     = "RV",
    ["Rvc"]    = "RC",
    ["Rvx"]    = "RX",
    ["c"]      = "CO",
    ["cv"]     = "CV",
    ["r"]      = "PR",
    ["rm"]     = "PM",
    ["r?"]     = "P?",
    ["!"]      = "SH",
    ["t"]      = "TE",
    -- stylua: ignore end
  }
  local hl = vim.bo.mod and "TermCursor" or "Statusline"
  return string.format("%%#%s# %s", hl, modes[vim.api.nvim_get_mode().mode] or "UNKNOWN")
end

-- Function to get the current working directory name
---@return string
local function get_cwd()
  return string.format(
    " %%<%%#StatusLinePath# %s ",
    ---@diagnostic disable-next-line: undefined-field
    vim.fn.fnamemodify(vim.uv.cwd(), ":t")
  )
end

-- Function to get the current file path relative to CWD and modified status
---@return string
local function get_filename()
  if vim.bo.filetype == "intro" then
    return ""
  end
  local file = vim.fn.expand("%:p") -- Get the full path of the current file
  ---@diagnostic disable-next-line: undefined-field
  local cwd = vim.uv.cwd()
  local modified = vim.bo.modified and "  " or ""

  -- Calculate the relative path by removing the CWD from the full path
  local relative_path = file:gsub(cwd .. "/", "")
  vim.b.filename_statusline = relative_path

  local components = vim.split(relative_path, "/")
  local num_components = #components

  -- If there more than 3 components in the path,truncate to the last 3
  if num_components > 3 then
    components = vim.list_slice(components, num_components - 2) -- yep this keeps 3
    relative_path = ".../" .. table.concat(components, "/")
  end

  local _, MiniIcons = pcall(require, "mini.icons")
  local icon, hl, is_default = MiniIcons.get("file", tostring(relative_path))
  hl = statusline.define_highlight("Fileicon", hl)
  -- hl = require("utils.hi").blend_highlight_groups(hl, "StatusLine", "bg", 0.7)
  icon = is_default and "" or icon

  return string.format(
    "%%#%s#%s %%#%s#%s%%#%s#%s ",
    hl,
    icon,
    "StatusLine",
    relative_path,
    statusline.define_highlight("Modified", "Substitute", "bg", true),
    modified
  )
end

---@return string
local function get_git_status()
  local minidiff = vim.b.minidiff_summary
  local branch_name = vim.b.git_branch and vim.b.git_branch or ""
  if not minidiff then
    return string.format("%%#StatusLineGitBranch#%s ", branch_name)
  end
  -- this is a modfified logic from NvChad statusline ui (thank you) to show only if > 0.
  -- Define custom highlight groups for git status

  local added_hl = statusline.define_highlight("GitAdded", "MiniDiffSignAdd")
  local changed_hl = statusline.define_highlight("GitChanged", "MiniDiffSignChange")
  local removed_hl = statusline.define_highlight("GitRemoved", "MiniDiffSignDelete")
  -- Use the new highlight groups
  local added = minidiff.add and minidiff.add ~= 0 and string.format("%%#%s# +%d", added_hl, minidiff.add) or ""
  local changed = minidiff.change and minidiff.change ~= 0 and string.format("%%#%s# ~%d", changed_hl, minidiff.change)
    or ""
  local removed = minidiff.delete and minidiff.delete ~= 0 and string.format("%%#%s# -%d", removed_hl, minidiff.delete)
    or ""
  return string.format("%%#StatusLineGitBranch#%s %s%s%s", branch_name, added, changed, removed)
end

-- Function to get the LSP status
---@return string
local function get_lsp_status()
  local clients = vim.lsp.get_clients()
  for _, client in ipairs(clients) do
    ---@diagnostic disable-next-line: undefined-field
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, vim.bo.filetype) ~= -1 then
      return string.format("%%#StatusLineLSP#[%s]", client.name)
    end
  end
  return ""
end

local function python_env()
  if vim.bo.filetype == "python" then
    local venv = os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV")
    if venv then
      -- Check if venv is in .virtualenvs directory
      if string.match(venv, "/%.virtualenvs/") then
        venv = vim.fn.fnamemodify(venv, ":t")
      else
        -- Get parent directory of .venv
        venv = vim.fn.fnamemodify(venv, ":h:t")
      end
      return string.format("%%#StatusLineLSP# [󰩪 %s]", venv)
    end
  end
  return ""
end

local function getDiffSource()
  local buf_id = vim.api.nvim_get_current_buf()
  local diff_summary = vim.b[buf_id].minidiff_summary
  if not diff_summary then
    return ""
  end

  local diff_source = diff_summary.source_name

  local diffIcon = {
    git = " ",
    codecompanion = " ", -- 
  }

  return string.format("%%#StatusLineLSP#%s", diffIcon[diff_source] or "")
end

local model_patterns = {
  {
    match = "claude",
    handle = function(model)
      local variant = model:match("claude%-3%-5%-(%w+)") or model:match("claude%-3%-(%w+)")
      return variant and variant:gsub("sonnet", "sonnet3.5"):gsub("haiku", "haiku3") or model
    end,
  },
  {
    match = "llama",
    handle = function(model)
      local version, size = model:match("llama%-(%d+%.%d)%-(%w+)")
      return version and string.format("llama-%s-%s", version, size) or model
    end,
  },
  {
    match = "gpt%-4o",
    handle = function(model)
      return model == "gpt-4o-mini" and model or "gpt-4o"
    end,
  },
  {
    match = "o1%-",
    handle = function(model)
      return model
    end,
  },
}

local function truncate_model_name(model)
  for _, pattern in ipairs(model_patterns) do
    if model:match(pattern.match) then
      return pattern.handle(model)
    end
  end
  return model
end

-- Table to store LLM information for each buffer
---@type table
local llm_info = {}
local processing = false
-- Function to get the LLM status for CodeCompanion
---@return string
local function get_codecompanion_status()
  -- Create a single autocmd for both events
  vim.api.nvim_create_autocmd("User", {
    pattern = {
      "CodeCompanionChatAdapter",
      "CodeCompanionChatModel",
      "CodeCompanionRequest*",
    },
    callback = function(args)
      if args.match == "CodeCompanionRequestStarted" then
        processing = true
      elseif args.match == "CodeCompanionRequestFinished" then
        processing = false
      elseif not vim.tbl_isempty(args.data) then
        local bufnr = args.data.bufnr
        llm_info[bufnr] = llm_info[bufnr] or {}
        if args.match == "CodeCompanionChatAdapter" and args.data.adapter then
          llm_info[bufnr].name = args.data.adapter.name
        elseif args.match == "CodeCompanionChatModel" and args.data.model then
          llm_info[bufnr].model = truncate_model_name(args.data.model)
        end
      end
    end,
  })
  local bufnr = vim.api.nvim_get_current_buf()
  local info = llm_info[bufnr]

  if not info or not info.name then
    return ""
  end

  local icon, hl
  if processing then
    icon = "✨"
    hl = statusline.define_highlight("CodeCompanionProcessing", "Special")
  else
    local _, mini_icons = pcall(require, "mini.icons")
    if not mini_icons then
      return ""
    end
    icon, hl = mini_icons.get("lsp", info.name)
    hl = statusline.define_highlight("CodeCompanionLSP", hl)
  end

  local llm_name = string.format("%%#%s#%s%%*", hl, icon or info.name)
  local model_info = info.model and ("- " .. info.model) or ""
  local status = llm_name .. model_info
  return vim.bo.filetype == "codecompanion" and string.format("%%#StatusLineLSP#|%s|", status) or ""
end

-- Function to get diagnostics count with improved efficiency
---@return string
local function get_diagnostics()
  if not vim.diagnostic.is_enabled() or vim.bo.filetype == "intro" then
    return ""
  end
  ---@type table, table, table, table
  local diagnostics, counts, result, severities
  diagnostics = vim.diagnostic.get(0)
  counts = { 0, 0, 0, 0 }

  for _, d in ipairs(diagnostics) do
    counts[d.severity] = (counts[d.severity] or 0) + 1
  end

  result = {}
  severities = { "Error", "Warn", "Info", "Hint" }

  for i, severity in ipairs(severities) do
    local _, MiniIcons = pcall(require, "mini.icons")
    local icon, hl = MiniIcons.get("lsp", severity)
    hl = statusline.define_highlight(severity, hl)
    if counts[i] > 0 then
      table.insert(result, string.format("%%#%s#%s%d", hl, icon, counts[i]))
    end
  end

  return table.concat(result, " ")
end

-- Function to get word count for markdown files
---@return string
local function get_word_count()
  if vim.bo.filetype == "markdown" or vim.bo.filetype == "codecompanion" then
    if vim.fn.expand("%:p:h") == vim.fn.expand("$HOME/.local/share/nvim/parrot/chats") then
      ---@type number, integer, integer, integer
      local word_count, line_count, char_count, token_count
      word_count = vim.fn.wordcount().words
      line_count = vim.fn.line("$")
      char_count = vim.fn.line2byte(line_count + 1) - 1
      token_count = math.floor(char_count / 4) -- approximate token count, assuming 4 characters per token
      return string.format(" %%#StatusLineWordCount#%d words, %d tokens ", word_count, token_count)
    else
      local word_count = vim.fn.wordcount().words
      return string.format(" %%#StatusLineWordCount#%d words ", word_count)
    end
  end
  return ""
end

--- TODO: refactor this to use the new APIs from Arrow
---@return string
local function arrow_knot()
  -- Check if arrow.nvim is loaded
  if vim.g.arrow_enabled == nil then
    return ""
  end
  ---@type table, string, table, boolean
  local index_keys, current_file, arrow_files, file_in_arrow
  index_keys = { "a", "f", "g" } -- Define the index keys
  current_file = vim.b.filename_statusline
  arrow_files = vim.g.arrow_filenames
  -- Check if current file is in the Arrow list
  file_in_arrow = false
  for _, filename in ipairs(arrow_files) do
    if filename == current_file then
      file_in_arrow = true
      break -- Found it, no need to continue the loop
    end
  end

  if not file_in_arrow then
    return ""
  end -- Only proceed if file is in the list
  local total_items = #arrow_files

  if total_items == 0 then
    return ""
  end

  local icon = { "󱡁 " }
  for index = 1, math.min(total_items, #index_keys) do -- Iterate up to a maximum of 3 (whatever is less)
    local hl
    if arrow_files[index] == current_file then
      hl = statusline.define_highlight("ArrowCurrentFile", "Error", nil, true)
    else
      hl = "StatusLine"
    end

    table.insert(icon, string.format("%%#%s#%s", hl, index_keys[index]))
  end

  return table.concat(icon, "")
end

-- funtion for seprator
---@param sep string
---@param hl string
---@param func function
---@return string
local function get_sep(sep, hl, func)
  local content = func()
  if content == "" then
    return ""
  end
  return string.format("%%#%s#%s", hl, sep)
end

-- Function to get the line and column info
---@return string
local function get_line_info()
  -- local cur_line = vim.api.nvim_win_get_cursor(0)[1]
  -- local lines = vim.api.nvim_buf_line_count(0)
  ---@type integer, integer, integer, table, integer, string, string
  local current_line, column, total_lines, sbar_chars, i, sbar, hl_scrollbar
  current_line = vim.fn.line(".")
  column = vim.fn.col(".")
  total_lines = vim.fn.line("$")

  sbar_chars = { "▔", "🮂", "🮃", "🮑", "🮒", "▃", "▂", "▁" }
  i = math.floor((current_line - 1) / total_lines * #sbar_chars) + 1
  sbar = string.rep(sbar_chars[i], 2)
  hl_scrollbar = statusline.define_highlight("Scrollbar", "Substitute", "bg", true)
  -- local percent = math.floor((line / total_lines) * 100) .. tostring("%%")
  return string.format(" %%#%s#%02d/%d %%#%s#%s", "StatusLinePosition", column, total_lines, hl_scrollbar, sbar)
end

-- Setup the statusline
function statusline.active()
  return table.concat({
    get_mode(),
    get_cwd(),
    get_sep("| ", "StatusLineSeparator", getDiffSource),
    getDiffSource(),
    get_git_status(),
    " %<",
    "%=",
    get_filename(),
    "%<",
    "%=",
    arrow_knot(),
    get_sep("|", "StatusLineSeparator", arrow_knot),
    get_codecompanion_status(),
    get_diagnostics(),
    python_env(),
    get_lsp_status(),
    get_word_count(),
    get_line_info(),
  })
end

-- Set the statusline
vim.o.statusline = "%!v:lua.statusline.active()"
return statusline
