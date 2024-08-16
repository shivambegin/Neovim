# Neovim

<a href="https://dotfyle.com/shivambegin/neovim"><img src="https://dotfyle.com/shivambegin/neovim/badges/plugins?style=social" /></a>
<a href="https://dotfyle.com/shivambegin/neovim"><img src="https://dotfyle.com/shivambegin/neovim/badges/leaderkey?style=social" /></a>
<a href="https://dotfyle.com/shivambegin/neovim"><img src="https://dotfyle.com/shivambegin/neovim/badges/plugin-manager?style=social" /></a>

## Installation
 > Install requires Neovim nightly but might works on latest stable release. Always review the code before installing a configuration.

> Make sure you delete or backup your old neovim configuration to somewhere safe before installing this one.

### Backup linux &MacOS

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

### Backup for Windows

```bash
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

### Linux & MacOS

```bash
git clone https://github.com/shivambegin/Neovim.git ~/.config/nvim
```

### Windows

```bash
git clone https://github.com/shivambegin/Neovim.git $env:LOCALAPPDATA\nvim
```

