return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[　　　 　　/＾>》, -―‐‐＜＾}]],
      [[　　　 　./:::/,≠´::::::ヽ.]],
      [[　　　　/::::〃::::／}::丿ハ]],
      [[　　　./:::::i{l|／　ﾉ／ }::}]],
      [[　　 /:::::::瓜イ＞　´＜ ,:ﾉ]],
      [[　 ./::::::|ﾉﾍ.{､　(_ﾌ_ノﾉイ＿]],
      [[　 |:::::::|／}｀ｽ /          /]],
      [[.　|::::::|(_:::つ/ ArchLinux /　neovim!]],
      [[.￣￣￣￣￣￣￣＼/＿＿＿＿＿/￣￣￣￣￣]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find project", ":lua require'telescope.builtin'.find_files{}<CR>", {}),

      dashboard.button("r", "  Recent files", ":lua require'telescope.builtin'.oldfiles{}<CR>", {}),

      dashboard.button("q", "ﰌ  Quit", ":qa<CR>", {}),
    }
    require("alpha").setup(dashboard.config)
  end,
}
