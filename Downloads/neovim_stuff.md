# NeoVim configuration notes

## Installation
1. In Arch linux run the command `sudo pacman -S neovim`
2. Install `xclip` in order to let vim use the clipboard if needed: `sudo pacman -S xclip`.
2. After installation, create an the folder `~/.config/nvim`.

## Folder structure
### init.lua file
2. The main file that should be in the `nvim` folder is `init.lua`, this holds the commands that will eun at the openning of NeoVim.
3. In the `init.lua` the first thing we do is initialize `lazy.vim` as it is out plugin manager. We first check if lazy exists, if it is not we clone it from github (latest stable release) and we require it and call setup on it with a parameter that states where are the plugins located.
4. In the file we will also require the `vim-options.lua` which we will get to shortly.

### lua folder
1. In the `nvim` configuration folder create a new folder called `lua`. This folder will hold all our `lua` scripts.

### vim-options.lua file
1. This file holds a lot of the vim options that are used by us (which are not related to a specific plugin) including general keybindings that are not related to plugins as well.
2. In the `lua` folder, create a new file called `vim-options.lua`.
3. Enter any options and keybindings you'd like, for example:
```
vim.cmd("set number") -- Shows line number column

vim.g.mapleader = " " -- Sets the leader key to be spacew
```

### plugins folder
1. In the `lua` folder create a new folder called `plugins`. This folder will hold all our plugins specific`lua` scripts.

### alpha.lua
1. This file holds the configuration for the alpha plugin which just shows a nice welcome ascii screen when opening neovim without a specific file.
The configuration was copied from the plugin github page:
[Alpha Github Page](https://github.com/goolord/alpha-nvim)
[Shared themes thread](https://github.com/goolord/alpha-nvim/discussions/16)

### catppuccin.lua
1. This file holds the configuration of the theme we will use *catppuccin*.
The configuration was taken from the plugin github page:
[Catppuccin Github Page](https://github.com/catppuccin/nvim)

### lualine.lua
1. This file holds the configuration for lualine, a blazing fast and easy to configure neovim statusline plugin written in pure lua.
The configuration was taken from the plugin github page (we use the *Dracula* theme):
[LuaLine Github Page](https://github.com/nvim-lualine/lualine.nvim).
[LiaLine available Themes](https://github.com/nvim-lualine/lualine.nvim/blob/master/THEMES.md).

### neotree.lua
1. This file holds the configuration for netree, a plugin to manage the file system and other tree like structures.
In the configuration we configure to use the `<leader>n` keybinding to toggle a file explorer pane at the right side of the screen.
The configuration was taken from the plugin github page (we use the *Dracula* theme):
[NeoTree Github Page](https://github.com/nvim-neo-tree/neo-tree.nvim).

### telescope.lua
1. This file holds the configuration for telescope, a highly extendable fuzzy finder over lists.
In the configuration we configure to use the `<leader>ff` keybinding to fuzzy find files in current workspace, and we use the `<leader>fg` to grep inside of files in the current workspace.
The basic configuration was taken from the telescope plugin github page:
[Telescope Github Page](https://github.com/nvim-telescope/telescope.nvim).
2. In addition we configure the `telescope-ui-select` plugin, it sets `vim.ui.select` to telescope. That means for example that neovim core stuff can fill the telescope picker.
The basic configuration was taken from the telescope plugin github page:
[Telescope-UI-Select Github Page](https://github.com/nvim-telescope/telescope-ui-select.nvim).

### treesitter.lua
1. This file holds the configuration for treesiter, a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it.
In the configuration we ensured installation of the parsers for the following languages:
- bash
- c
- cmake
- cpp
- gitignore
- glsl
- go
- json
- linkerscript
- markdown
- python
- lua
- rust
- tmux
- vim
- yaml
- zig

The basic configuration was taken from the treesitter plugin github page:
[Telescope Github Page](https://github.com/nvim-treesitter/nvim-treesitter).
