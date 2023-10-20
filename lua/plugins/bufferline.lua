return	{
	"akinsho/bufferline.nvim",
	config = function()
		local ok, bufferline = pcall(require, "bufferline")
		if not ok then
			return
		end

		bufferline.setup({
			options = {
				offsets = {
					{ filetype = "NvimTree", text = "", padding = 0 },
					{ filetype = "neo-tree", text = "File Tree", padding = 0 },
					{ filetype = "Outline", text = "", padding = 0 },
				},
				max_name_length = 14,
				max_prefix_length = 13,
				tab_size = 20,
				separator_style = { " » ", " » " },
				style_preset = bufferline.style_preset.no_italic,
			},
		})
	end,
	event = "VeryLazy",
	enabled = true,
}
