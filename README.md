# Terminal configuration files 
Configuration files for terminal environment, [nnn][1] and vim.

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
Add key bindings to terminator config file in `$HOME/.config/terminator/config`

# Additional configurations

## Local configurations
Add all local configurations in `~/.bashrc.local`. This file is loaded by default if it exists.

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
   1.  https://vi.stackexchange.com/questions/5441/is-it-possible-and-useful-to-split-vimrc 
1. Easy way to setup my github ssh access
2. Add shebangs to my scripts
4. Add compiled nnn to path
5. Add way of cleaning/removing all software
6. Add **terminator keybindings to mydotfiles**
7. Change shortcuts to open windows in vim to the ones in terminator
8. Add foldable sections to readme installation steps.
