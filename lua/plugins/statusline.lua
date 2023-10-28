local cmp = {} -- statusline components

--- highlight pattern
-- This has three parts:
-- 1. the highlight group
-- 2. text content
-- 3. special sequence to restore highlight: %*
-- Example pattern: %#SomeHighlight#some-text%*
local hi_pattern = '%%#%s#%s%%*'

function _G._statusline_component(name)
  return cmp[name]()
end

function cmp.diagnostic_status()
  local ok = ' λ '

  local ignore = {
    ['c'] = true, -- command mode
    ['t'] = true  -- terminal mode
  }

  local mode = vim.api.nvim_get_mode().mode

  if ignore[mode] then
    return ok
  end

  local levels = vim.diagnostic.severity
  local errors = #vim.diagnostic.get(0, {severity = levels.ERROR})
  if errors > 0 then
    return '  '
  end

  local warnings = #vim.diagnostic.get(0, {severity = levels.WARN})
  if warnings > 0 then
    return '  '
  end

  return ok
end

function cmp.position()
  return hi_pattern:format('Search',' %3l:%-2c ')
end

local statusline = {
  '%{%v:lua._statusline_component("diagnostic_status")%} ',
  '%t',
  '%r',
  '%m',
  '%=',
  '%{&filetype} ',
  ' %2p%% ',
  '%{%v:lua._statusline_component("position")%}'
}


vim.o.statusline = table.concat(statusline, '')




-- disabled the lualine as i am using builtin statusline for now




return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    lazy = false,
    enabled = false,
    opts = function()
        local get_hlgroup = require("base.utils").get_hlgroup
        local colours = {
            bg = get_hlgroup("Normal").bg,
            fg = "#f8f8f2",
            grey = "#565f89",
            green = "#9ece6a",
            yellow = "#e0af68",
            blue = "#7aa2f7",
            magenta = "#bb9af7",
            red = "#f7768e",
            cyan = "#7dcfff",
            orange = "#ff9e64",
            nonecolour = "#000000"
        }
        local copilot_colours = {
            [""] = { fg = colours.grey, bg = colours.bg },
            ["Normal"] = { fg = colours.grey, bg = colours.bg },
            ["Warning"] = { fg = colours.red, bg = colours.bg },
            ["InProgress"] = { fg = colours.yellow, bg = colours.bg },
        }
        return {
            options = {
                component_separators = { left = " ", right = " " },
                theme = {
                    normal = {
                        a = { fg = colours.blue, bg = colours.bg },
                        b = { fg = colours.cyan, bg = colours.bg },
                        c = { fg = colours.fg, bg = colours.bg },
                        x = { fg = colours.fg, bg = colours.bg },
                        y = { fg = colours.magenta, bg = colours.bg },
                        z = { fg = colours.grey, bg = colours.bg },
                    },
                    insert = {
                        a = { fg = colours.green, bg = colours.bg },
                        z = { fg = colours.grey, bg = colours.bg },
                    },
                    visual = {
                        a = { fg = colours.magenta, bg = colours.bg },
                        z = { fg = colours.grey, bg = colours.bg },
                    },
                    terminal = {
                        a = { fg = colours.orange, bg = colours.bg },
                        z = { fg = colours.grey, bg = colours.bg },
                    },
                },

                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
            },
            sections = {
                lualine_a = { { "mode", icon = "" } },
                lualine_b = { { "branch", icon = "" } },
                lualine_c = {
                    {
                        "diagnostics",
                        symbols = {
                            error = " ",
                            warn = " ",
                            info = " ",
                            hint = "󰝶 ",
                        },
                    },
                    { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                    {
                        "filename",
                        symbols = { modified = "  ", readonly = "", unnamed = "" },
                    },
                    {
                        function()
                            local msg = 'Disabled'
                            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                            local clients = vim.lsp.get_active_clients()
                            if next(clients) == nil then
                              return msg
                            end
                            for _, client in ipairs(clients) do
                              local filetypes = client.config.filetypes
                              if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                              end
                            end
                            return msg
                          end,
                          icon = ' LSP:',
                          color = { fg = colours.magenta, gui = 'bold' },
                    }
                },
                lualine_x = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                        color = { fg = colours.green },
                    },
                    {
                        function()
                            local icon = " "
                            local status = require("copilot.api").status.data
                            return icon .. (status.message or "")
                        end,
                        cond = function()
                            local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
                            return ok and #clients > 0
                        end,
                        color = function()
                            if not package.loaded["copilot"] then
                                return
                            end
                            local status = require("copilot.api").status.data
                            return copilot_colours[status.status] or copilot_colours[""]
                        end,
                    },
                    { "diff" },
                },
                lualine_y = {
                    {
                        "progress",
                    },
                    {
                        "location",
                        color = { fg = colours.cyan, bg = colours.bg },
                    },
                },
                lualine_z = {
                    function()
                        return "  " .. os.date("%X") .. " 📎"
                    end,
                },
            },

            extensions = { "lazy" },
        }
    end,
}
