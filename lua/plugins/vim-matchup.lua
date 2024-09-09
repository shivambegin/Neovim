--extends % motion
return {
  "andymass/vim-matchup",
  enabled = false,
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  setup = function()
    vim.g.matchup_matchparen_deferred = 1 -- improve scrolling performance
    vim.g.matchup_matchparen_deferred_show_delay = 16
    vim.g.matchup_matchparen_deferred_hide_delay = 16
    vim.g.matchup_matchparen_offscreen = {} -- don't show offscreen matches
    vim.g.matchup_matchparen_end_sign = require("utils.static").icons.ArrowLeft

    local has_nvim_ts_cfg, nvim_ts_cfg = pcall(require, "nvim-treesitter.configs")
    if has_nvim_ts_cfg then
      ---@diagnostic disable-next-line: missing-fields
      nvim_ts_cfg.setup({
        matchup = {
          enable = true,
          disable_virtual_text = true,
        },
      })
    end
  end,
}
