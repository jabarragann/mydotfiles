# Master CLI configuration 

<!--toc:start-->
- [Master CLI configuration](#master-cli-configuration)
- [Terminal configuration files](#terminal-configuration-files)
- [Installation](#installation)
  - [Preparative steps](#preparative-steps)
  - [Install my configs](#install-my-configs)
- [Additional configurations](#additional-configurations)
  - [Compile nnn](#compile-nnn)
  - [Vim plugin manager, vim-plug](#vim-plugin-manager-vim-plug)
  - [Terminator config](#terminator-config)
  - [Local configurations](#local-configurations)
  - [Anaconda config](#anaconda-config)
  - [kitty install instructions](#kitty-install-instructions)
- [TODO:](#todo)
<!--toc:end-->

# Terminal configuration files 

Configuration files for terminal environment, [nnn][1] nvim and vim.

[1]: https://github.com/jarun/nnn

**Included features**
1. [nnn configurations](#compile-nnn) 
2. icon support in nnn with [nerd-fonts](https://github.com/ryanoasis/nerd-fonts)
3. [vim configurations](#vim-plugin-manager-vim-plug)
4. [Kitty config setup](#kitty-install-instructions)
5. nvim-configuration - see [here](/nvim/nvim_notes_juan.md) 


# Installation

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


# Additional configurations

## Compile nnn

```bash
# Without sudo access
make O_NERD=1
mkdir ~/.local/bin
cp ./nnn ~/.local/bin/

# With sudo access
sudo make O_NERD=1 strip install
```

Optional install nnn plugins (Use the getplugs script) 
```
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
```

## Vim plugin manager, vim-plug

More documentation on [plugin-config](/vim/vim_plugins.md)

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


## kitty install instructions 

1. Install Kitty
Instructions from: https://sw.kovidgoyal.net/kitty/binary/
```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
```

2. Make kitty default terminal
Note: In ubuntu default terminal can be opened with `ctrl+alt+t`
```
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(which kitty) 50
sudo update-alternatives --config x-terminal-emulator
```

3. Important Kitty plugins

VIM kitty navigator
Automatically installed with nvim. See [nvim notes](./nvim/nvim_notes_juan.md)
```
https://github.com/knubie/vim-kitty-navigator
```

Kitty grab (Not actively used in my setup)
```
cd ~/.config/kitty
git clone https://github.com/yurikhan/kitty_grab.git
#copy kitty-grab.conf to .mydotfiles
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
