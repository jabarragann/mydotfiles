#!/bin/bash

LOCAL_BIN=$HOME/.local/bin
mydotfiles="$HOME/mydotfiles"
programsdir="$HOME/programs/"

mkdir -v -p $programsdir

if [ ! -d $LOCAL_BIN  ]; then
    mkdir -p $LOCAL_BIN
    echo "Creating local bin folder: $LOCAL_BIN"
fi

# Create symbolic links
echo -e " \n <-----Creating symbolic links-----> \n"
ln -s $HOME/mydotfiles/git/gitconfig ~/.gitconfig
ln -s $HOME/mydotfiles/vim/vimrc ~/.vimrc
ln -s $HOME/mydotfiles/aliases/aliases.sh $HOME/.aliases
ln -s $HOME/mydotfiles/kitty/kitty.conf $HOME/.config/kitty/kitty.conf
# Not secure to store ssh keys in public repo.
# ln -s $HOME/mydotfiles/ssh/config $HOME/.ssh/config

# Add juan configs to bashrc
echo 'source $HOME/mydotfiles/bash/bashrc.sh' >> ~/.bashrc

# NVIM CONFIGURATION
#####################
git clone git@github.com:jabarragann/neovim_config.git ~/.config/nvim

# INSTALL NERD FONTS
#####################

echo -e "\n <-----Downloading nerd fonts-----> \n"
local_fonts_dir="$HOME/.local/share/fonts/nerdfonts/"
mkdir -v -p $local_fonts_dir

nerd_fonts_url=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
wget -O $local_fonts_dir/Hack_v3.0.2.zip -nv  $nerd_fonts_url
unzip $local_fonts_dir/Hack_v3.0.2.zip -d $local_fonts_dir/

# Regenerate font cache
fc-cache -f 
echo | fc-list | grep "Hack"

# NNN INSTALLATION
##################
echo -e "\n <-----Downloading nnn -----> \n"
nnn_version="5.1"
wget -O $programsdir/nnn-v${nnn_version}.tar.gz -nv https://github.com/jarun/nnn/releases/download/v${nnn_version}/nnn-v${nnn_version}.tar.gz
tar xf $programsdir/nnn-v${nnn_version}.tar.gz -C $programsdir 


echo -e "\n <-----Compiling nnn -----> \n"

# Compile and install nnn
cd $programsdir/nnn-${nnn_version}
make O_NERD=1
ln -sf $programsdir/nnn-${nnn_version}/nnn $LOCAL_BIN 

# FZF INSTALLATION
##################

echo -e "\n <-----Installing fzf  -----> \n"

git clone --depth 1 https://github.com/junegunn/fzf.git $programsdir/fzf
$programsdir/fzf/install
