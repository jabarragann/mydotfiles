# NVIM setup notes

<!--toc:start-->
- [NVIM setup notes](#nvim-setup-notes)
  - [Shortcuts and usage.](#shortcuts-and-usage)
  - [NVIM install](#nvim-install)
  - [LSP servers and configurations](#lsp-servers-and-configurations)
    - [Marksman - Markdown](#marksman---markdown)
    - [Pyright - Python](#pyright---python)
<!--toc:end-->


## Shortcuts and usage.
* F4: Activate code actions (Generates table of content in markdown file with Marksman LSP)

## NVIM install

My nvim configuration repository: [neovim_config](https://github.com/jabarragann/neovim_config)

Download config
```
git clone https://github.com/jabarragann/nvim_config.git ~/.config/nvim
# or 
git clone git@github.com:jabarragann/neovim_config.git ~/.config/nvim
mkdir $HOME/.config/kitty/
```

Install nvim binary
```
sudo apt install xclip
cd ~/programs
```
Current:
```
NVIM_VER="v0.11.5" #Or v0.10.4 for Ubuntu 20.04
wget -O nvim-${NVIM_VER}.tar.gz "https://github.com/neovim/neovim/releases/download/${NVIM_VER}/nvim-linux-x86_64.tar.gz"
mkdir -p "nvim-${NVIM_VER}"
tar -xf nvim-${NVIM_VER}.tar.gz -C "nvim-${NVIM_VER}"
ln -sf "$HOME/programs/nvim-${NVIM_VER}/nvim-linux-x86_64/bin/nvim" "$HOME/.local/bin/nvim"
```

Notes: 0.10.4 is the latest official version to work with ubuntu 20.04.

## LSP servers and configurations

### Marksman - Markdown
```
wget https://github.com/artempyanykh/marksman/releases/download/2024-12-18/marksman-linux-x64
mv marksman-linux-x64 marksman
chmod +x marksman 
mv marksman ~/.local/bin/
```

### Pyright - Python
```
pip install pyright
```
