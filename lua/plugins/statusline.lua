local icons = {
	python = "",
	node = "",
	java = "",
	go = "",
}
-- Used by the runtime spec component
-- We cache the results of the runtime spec component so we don't have to run the
-- expensive "--version" commands
local runtime_cache = {
	node = nil,
	python = nil,
	java = nil,
	go = nil,
}

local spinners = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
-- This stands for web development buffer selections i swear
local web_dev_bs = { "javascript", "javascriptreact", "typescript", "typescriptreact" }

local function copilot_indicator()
	local client = vim.lsp.get_active_clients({ name = "copilot" })[1]
	if client == nil then
		return ""
	end

	if vim.tbl_isempty(client.requests) then
		return ""
	end

	local ms = vim.loop.hrtime() / 1000000
	local frame = math.floor(ms / 120) % #spinners

	return spinners[frame + 1]
end

-- The LSP+copilot_active stuff is excerpt from Lunarvim
local function get_attached_clients()
	local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
	if #buf_clients == 0 then
		return "LSP Inactive"
	end

	local buf_ft = vim.bo.filetype
	local buf_client_names = {}

	-- add client
	for _, client in pairs(buf_clients) do
		-- Ignore copilot and the actuall null-ls LSP names
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
	for _, name in pairs(buf_client_names) do
		if not vim.tbl_contains(unique_client_names, name) then
			table.insert(unique_client_names, name)
		end
	end

	local client_names_str = table.concat(unique_client_names, ", ")
	local language_servers = string.format("[%s]", client_names_str)

	return language_servers
end

-- Excerpt from Lunarvim
local function get_python_venv()
	local venv_cleanup = function(venv)
		if string.find(venv, "/") then
			local final_venv = venv
			for w in venv:gmatch("([^/]+)") do
				final_venv = w
			end
			venv = final_venv
		end
		return venv
	end

	-- This works for venv, poetry, conda, etc.
	local venv = os.getenv("CONDA_DEFAULT_ENV") or os.getenv("VIRTUAL_ENV")
	local py_version = vim.fn.system("python3 -V")
	py_version = py_version:gsub("\n", "")
	py_version = py_version:gsub("Python ", "")

	if venv then
		return string.format("%s %s", icons.python, venv_cleanup(venv))
	end

	return string.format("%s %s", icons.python, py_version)
end

local function get_java_version()
	local jdk_version = vim.fn.system("java --version 2>&1 | head -n 1")

	if jdk_version == "" then
		return nil
	end
	jdk_version = jdk_version:gsub(" (202%d-.-)$", "")

	return string.format(icons.java .. " %s", jdk_version:gsub("\n", ""))
end

local function get_node_version()
	local node_version = vim.fn.system("node --version")

	if node_version == "" then
		return nil
	end

	return string.format(icons.node .. " %s", node_version:gsub("\n", ""))
end

local function get_go_version()
	local go_path = vim.fn.system("which go")
	if go_path == "" then
		return nil
	end
	go_path = go_path:gsub("\n", "")
	local go_command = go_path .. " version"
	local go_version = vim.fn.system(go_command)
	if #go_version > 0 then
		-- Match 'go' followed by any numbers until whitespace
		go_version = go_version:match("go[%d%.]+")
		go_version = go_version:gsub("go", "")
	end

	return string.format(icons.go .. " %s", go_version)
end

local function build_runtime_spec_component()
	local buf_ft = vim.bo.filetype
	if vim.tbl_contains(web_dev_bs, buf_ft) then
		local node_version = runtime_cache.node or get_node_version()
		runtime_cache.node = node_version
		return {
			node_version,
			color = {
				fg = "#f7df1e",
				bg = "#1E1E1E",
			},
		}
	elseif buf_ft == "python" then
		local python_venv = runtime_cache.python or get_python_venv()
		runtime_cache.python = python_venv
		return {
			python_venv,
			color = {
				fg = "#6082B6",
				bg = "#1E1E1E",
			},
		}
	elseif buf_ft == "java" then
		local java_version = runtime_cache.java or get_java_version()
		runtime_cache.java = java_version
		return {
			java_version,
			color = {
				fg = "#9b3928",
				bg = "#1E1E1E",
			},
		}
	elseif buf_ft == "go" then
		local go_version = runtime_cache.go or get_go_version()
		runtime_cache.go = go_version
		return {
			go_version,
			color = {
				fg = "#00ADD8",
				bg = "#1E1E1E",
			},
		}
	end

	return nil
end

return {
	"nvim-lualine/lualine.nvim",
	event = { "VimEnter", "BufReadPost", "BufNewFile" },
	config = function()
		local copilot_component = {
			copilot_indicator,
			color = {
				fg = "#6CC644",
				bg = "#1E1E1E",
			},
		}
		local attached_clients_component = {
			get_attached_clients,
			color = {
				gui = "bold",
			},
		}

		local spaces_component = {
			function()
				local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
				return "󰌒 " .. shiftwidth
			end,
			padding = 1,
		}

		local runtime_spec_component = {
			function()
				local component = build_runtime_spec_component()
				if component then
					return component[1]
				end
			end,
			color = function()
				local component = build_runtime_spec_component()
				if component then
					return component.color
				end
			end,
			cond = function()
				local component = build_runtime_spec_component()
				return component ~= nil and component[1] ~= nil
			end,
		}

		require("lualine").setup({
			options = {
				theme = "auto",
				globalstatus = true,
				component_separators = { left = "", right = "" },
				refresh = {
					statusline = 200,
				},
			},

			sections = {
				lualine_b = { "branch" },
				lualine_c = { "diff", runtime_spec_component },
				lualine_x = {
					"diagnostics",
					attached_clients_component,
					copilot_component,
					spaces_component,
					"filetype",
				},
			},
		})
	end,
}
-- return{
-- {
--     "nvim-lualine/lualine.nvim",
--     event = "VeryLazy",
--     lazy = false,
--     enabled = false,
--     opts = function()
--         local get_hlgroup = require("base.utils").get_hlgroup
--         local colours = {
--             bg = get_hlgroup("Normal").bg,
--             fg = "#f8f8f2",
--             grey = "#565f89",
--             green = "#9ece6a",
--             yellow = "#e0af68",
--             blue = "#7aa2f7",
--             magenta = "#bb9af7",
--             red = "#f7768e",
--             cyan = "#7dcfff",
--             orange = "#ff9e64",
--             nonecolour = "#000000"
--         }
--         local copilot_colours = {
--             [""] = { fg = colours.grey, bg = colours.bg },
--             ["Normal"] = { fg = colours.grey, bg = colours.bg },
--             ["Warning"] = { fg = colours.red, bg = colours.bg },
--             ["InProgress"] = { fg = colours.yellow, bg = colours.bg },
--         }
--         return {
--             options = {
--                 component_separators = { left = " ", right = " " },
--                 theme = {
--                     normal = {
--                         a = { fg = colours.blue, bg = colours.bg },
--                         b = { fg = colours.cyan, bg = colours.bg },
--                         c = { fg = colours.fg, bg = colours.bg },
--                         x = { fg = colours.fg, bg = colours.bg },
--                         y = { fg = colours.magenta, bg = colours.bg },
--                         z = { fg = colours.grey, bg = colours.bg },
--                     },
--                     insert = {
--                         a = { fg = colours.green, bg = colours.bg },
--                         z = { fg = colours.grey, bg = colours.bg },
--                     },
--                     visual = {
--                         a = { fg = colours.magenta, bg = colours.bg },
--                         z = { fg = colours.grey, bg = colours.bg },
--                     },
--                     terminal = {
--                         a = { fg = colours.orange, bg = colours.bg },
--                         z = { fg = colours.grey, bg = colours.bg },
--                     },
--                 },

--                 globalstatus = true,
--                 disabled_filetypes = { statusline = { "dashboard", "alpha" } },
--             },
--             sections = {
--                 lualine_a = { { "mode", icon = "" } },
--                 lualine_b = { { "branch", icon = "" } },
--                 lualine_c = {
--                     {
--                         "diagnostics",
--                         symbols = {
--                             error = " ",
--                             warn = " ",
--                             info = " ",
--                             hint = "󰝶 ",
--                         },
--                     },
--                     { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
--                     {
--                         "filename",
--                         symbols = { modified = "  ", readonly = "", unnamed = "" },
--                     },
--                     {
--                         function()
--                             local msg = 'Disabled'
--                             local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--                             local clients = vim.lsp.get_active_clients()
--                             if next(clients) == nil then
--                               return msg
--                             end
--                             for _, client in ipairs(clients) do
--                               local filetypes = client.config.filetypes
--                               if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--                                 return client.name
--                               end
--                             end
--                             return msg
--                           end,
--                           icon = ' LSP:',
--                           color = { fg = colours.magenta, gui = 'bold' },
--                     }
--                 },
--                 lualine_x = {
--                     {
--                         require("lazy.status").updates,
--                         cond = require("lazy.status").has_updates,
--                         color = { fg = colours.green },
--                     },
--                     {
--                         function()
--                             local icon = " "
--                             local status = require("copilot.api").status.data
--                             return icon .. (status.message or "")
--                         end,
--                         cond = function()
--                             local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
--                             return ok and #clients > 0
--                         end,
--                         color = function()
--                             if not package.loaded["copilot"] then
--                                 return
--                             end
--                             local status = require("copilot.api").status.data
--                             return copilot_colours[status.status] or copilot_colours[""]
--                         end,
--                     },
--                     { "diff" },
--                 },
--                 lualine_y = {
--                     {
--                         "progress",
--                     },
--                     {
--                         "location",
--                         color = { fg = colours.cyan, bg = colours.bg },
--                     },
--                 },
--                 lualine_z = {
--                     function()
--                         return "  " .. os.date("%X") .. " 📎"
--                     end,
--                 },
--             },

--             extensions = { "lazy" },
--         }
--     end,
-- },
-- {
--     'vim-airline/vim-airline',
--     'vim-airline/vim-airline-themes',
--     event = "VeryLazy",
--     lazy = false,
--     enabled = false,
-- }
-- }
