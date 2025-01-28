<!--toc:start-->
- [Terminal configuration files](#terminal-configuration-files)
- [Installation steps](#installation-steps)
  - [Preparative steps](#preparative-steps)
  - [Install my configs](#install-my-configs)
  - [Compile nnn](#compile-nnn)
  - [Setup vim plugs](#setup-vim-plugs)
  - [Terminator config](#terminator-config)
- [Additional configurations](#additional-configurations)
  - [Local configurations](#local-configurations)
  - [Anaconda config](#anaconda-config)
- [TODO:](#todo)
  - [TODO NNN](#todo-nnn)
  - [TODO Update nvim install instructions](#todo-update-nvim-install-instructions)
    - [LSP servers](#lsp-servers)
  - [TODO Update kitty install instructions](#todo-update-kitty-install-instructions)
<!--toc:end-->

# Terminal configuration files 

Configuration files for terminal environment, [nnn][1] nvim and vim.

[1]: https://github.com/jarun/nnn

**Included features**
1. nnn configurations 
2. vim configurations 
3. icon support in nnn with [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)



# Installation steps 

## Preparative steps

1. Enable github ssh
2. Clone mydotfiles repository.

## Install my configs

1. Launch installation scripts to download nnn and nerdfonts
```bash
sudo ./install_cmd_utilities.sh #Install dependencies
./install.sh
```
2. Enable nerd fonts in terminal, e.g., terminator configuration
3. Remove history limits in default bashrc (HISTSIZE, HISTFILESIZE).


## Compile nnn

```bash
# Without sudo access
make O_NERD=1
mkdir ~/.local/bin
cp ./nnn ~/.local/bin/

# With sudo access
sudo make O_NERD=1 strip install
```

## Setup vim plugs

1. Install [vim-plug](https://github.com/junegunn/vim-plug)
```bash
# Check vim-plug link for the latest installation instruction
# Updated 2023-07-06
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
2. Open vim and run `:PlugInstall`

## Terminator config
Add key bindings to [terminator config](./terminator/terminator_config) file in `$HOME/.config/terminator/config`

# Additional configurations

## Local configurations
Add all local configurations in `~/.bashrc.local`. This file is loaded by default if it exists. In cases where the local files wants to be tracked created a symlink to a file in mydotfiles. For example:

```
ln -s ~/mydotfiles/bash/local/bash_juan_rog.sh ~/.bashrc.local
```

## Anaconda config
Avoid auto_activate of base environment
```
conda config --set auto_activate_base false
```
Reverse conda auto-activation
```
conda init --reverse $SHELL
```


# TODO:
0. Split VIMRC file into multiple files
   1.  <https://vi.stackexchange.com/questions/5441/is-it-possible-and-useful-to-split-vimrc>
1. Add terminator settings automatically to config.
2. In installation script check if `.local` directory is available if not create it.
1. Easy way to setup my github ssh access
2. Add shebangs to my scripts
4. Add compiled nnn to path
5. Add way of cleaning/removing all software
6. Add **terminator keybindings to mydotfiles**
7. Change shortcuts to open windows in vim to the ones in terminator
8. Add foldable sections to readme installation steps.
9. Add FZF in installation script

## TODO NNN
```
# plugin installation
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
```

## TODO Update nvim install instructions

```
sudo apt install xclip
wget https://github.com/neovim/neovim/releases/download/v0.10.3/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz nvim-linux64/
ln -s /home/juan95/programs/nvim-linux64/bin/nvim /home/juan95/.local/bin/
```
### LSP servers
Marksman
```
wget https://github.com/artempyanykh/marksman/releases/download/2024-12-18/marksman-linux-x64
mv marksman-linux-x64 marksman
chmod +x marksman 
mv marksman ~/.local/bin/
```

Pyright
```
pip install pyright
```

## TODO Update kitty install instructions 
```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which kitty) 50
sudo update-alternatives --config x-terminal-emulator
```
