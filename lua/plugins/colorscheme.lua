return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      transparent_background = true, -- disables setting the background color.
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#11111B",
          mantle = "#11111B",
        },
        macchiato = {
          rosewater = "#F5B8AB",
          flamingo = "#F29D9D",
          pink = "#AD6FF7",
          mauve = "#FF8F40",
          red = "#E66767",
          maroon = "#EB788B",
          peach = "#FAB770",
          yellow = "#FACA64",
          green = "#70CF67",
          teal = "#4CD4BD",
          sky = "#61BDFF",
          sapphire = "#4BA8FA",
          blue = "#00BFFF",
          lavender = "#00BBCC",
          text = "#C1C9E6",
          subtext1 = "#A3AAC2",
          subtext0 = "#8E94AB",
          overlay2 = "#7D8296",
          overlay1 = "#676B80",
          overlay0 = "#464957",
          surface2 = "#3A3D4A",
          surface1 = "#2F313D",
          surface0 = "#1D1E29",
          base = "#11111b",
          mantle = "#11111b",
          crust = "#191926",
        },
      },
      custom_highlights = function(colors)
        return {
          VertSplit = { fg = colors.surface0 },
          WinSeparator = {
            fg = colors.lavender,
          },
        }
      end,
    },
    init = function()
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
