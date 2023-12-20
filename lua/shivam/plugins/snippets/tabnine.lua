return {
  "codota/tabnine-nvim",
  build = "pwsh.exe -file .\\dl_binaries.ps1",
  enabled = false,
  config = function()
    require("tabnine").setup({
      disable_auto_comment = true,
      accept_keymap = "<Tab>",
      dismiss_keymap = "<C-]>",
      debounce_ms = 800,
      suggestion_color = { gui = "none", cterm = 244 },
      exclude_filetypes = { "TelescopePrompt", "NvimTree" },
      log_file_path = nil, -- absolute path to Tabnine log file
    })
  end,
}
