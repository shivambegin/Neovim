return {
  "rmagatti/auto-session",
  config = function()
    vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

    require("auto-session").setup({
      log_level = "error",
      auto_restore_enabled = true,
      auto_session_suppress_dirs = { "~/", "~/.config", "~/Downloads", "~/Documents" },
      cwd_change_handling = {
        post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
          require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
        end,
      },
    })
  end,
}
