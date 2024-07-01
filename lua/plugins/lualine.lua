local function get_attached_clients()
  local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
  if #buf_clients == 0 then
    return "LSP Inactive"
  end

  local buf_ft = vim.bo.filetype
  local buf_client_names = {}

  -- add client
  for _, client in pairs(buf_clients) do
    if client.name ~= "copilot" and client.name ~= "null-ls" then
      table.insert(buf_client_names, client.name)
    end
  end

  -- Generally, you should use either null-ls or nvim-lint + formatter.nvim, not both.

  -- Add sources (from null-ls)
  -- null-ls registers each source as a separate attached client, so we need to filter for unique names down below.
  local null_ls_s, null_ls = pcall(require, "null-ls")
  if null_ls_s then
    local sources = null_ls.get_sources()
    for _, source in ipairs(sources) do
      if source._validated then
        for ft_name, ft_active in pairs(source.filetypes) do
          if ft_name == buf_ft and ft_active then
            table.insert(buf_client_names, source.name)
          end
        end
      end
    end
  end
  -- This needs to be a string only table so we can use concat below
  local unique_client_names = {}
  for _, client_name_target in ipairs(buf_client_names) do
    local is_duplicate = false
    for _, client_name_compare in ipairs(unique_client_names) do
      if client_name_target == client_name_compare then
        is_duplicate = true
      end
    end
    if not is_duplicate then
      table.insert(unique_client_names, client_name_target)
    end
  end

  local client_names_str = table.concat(unique_client_names, ", ")
  local language_servers = string.format("[%s]", client_names_str)

  return language_servers
end
-- custom test component
local function Cuties()
  return [[Hello Cuties 🖤]]
end

local mode_map = {
  n = "(ᴗ_ ᴗ。)",
  nt = "(ᴗ_ ᴗ。)",
  i = "(•̀ - •́ )",
  R = "( •̯́ ₃ •̯̀)",
  v = "(⊙ _ ⊙ )",
  V = "(⊙ _ ⊙ )",
  no = "Σ(°△°ꪱꪱꪱ)",
  ["\22"] = "(⊙ _ ⊙ )",
  t = "(⌐■_■)",
  ["!"] = "Σ(°△°ꪱꪱꪱ)",
  c = "Σ(°△°ꪱꪱꪱ)",
  s = "SUB",
}

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "meuter/lualine-so-fancy.nvim",
  },
  event = "VeryLazy",
  config = function()
    local lazy_status = require("lazy.status") -- to configure lazy pending updates count
    local attached_clients = {
      get_attached_clients,
      color = {
        gui = "bold",
      },
    }
    require("lualine").setup({
      options = {
        icons_enabled = true,
        component_separators = "|",
        section_separators = "",
        theme = "poimandres",
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icons_enabled = true,
            separator = {
              left = "",
              right = "",
              -- right = ""
            },
            fmt = function()
              return mode_map[vim.api.nvim_get_mode().mode] or vim.api.nvim_get_mode().mode
            end,
          },
        },
        lualine_b = { "none" },
        lualine_c = { "fancy_branch", "fancy_diff" },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#eb6f92" },
          },
          { "fancy_diagnostics" },
          { "filename" },
          attached_clients,
        },
        lualine_y = { "none" },
      },
    })
  end,
}
