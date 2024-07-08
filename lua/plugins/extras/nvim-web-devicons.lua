return {
  "nvim-tree/nvim-web-devicons",
  lazy = true,
  config = function()
    local icons = require("nvim-web-devicons")

    icons.set_icon({
      deb = { icon = "", name = "Deb", color = "#A1B7EE" },
      lock = { icon = "", name = "Lock", color = "#C4C720" },
      mp3 = { icon = "󰈣", name = "Mp3", color = "#D39EDE" },
      mp4 = { icon = "", name = "Mp4", color = "#9EA3DE" },
      out = { icon = "󰈚", name = "Out", color = "#ABB2BF" },
      ["robots.txt"] = { icon = "󱜙", name = "Robots", "#ABB2BF" },
      [""] = { icon = "󰈚", name = "default", "#ABB2Bf" },
      norg = { icon = "󰈚", name = "default", "#ABB2Bf" },
      ttf = { icon = "", name = "TrueTypeFont", "#ABB2Bf" },
      rpm = { icon = "", name = "Rpm", "#FCA2Aa" },
      woff = { icon = "", name = "WebOpenFontFormat", color = "#ABB2Bf" },
      woff2 = { icon = "", name = "WebOpenFontFormat2", color = "#ABB2Bf" },
      xz = { icon = "", name = "Xz", color = "#519ABa" },
      zip = { icon = "", name = "Zip", color = "#F9D71c" },
      snippets = { icon = "", name = "Snippets", color = "#51AFEf" },
      ahk = { icon = "󰈚", name = "AutoHotkey", color = "#51AFEf" },
    })
  end,
}
