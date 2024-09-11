#!/bin/bash

mydotfiles="$HOME/mydotfiles"
programsdir="$HOME/programs/"
mkdir -v -p $programsdir


# Create symbolic links
echo -e " \n <-----Creating symbolic links-----> \n"
ln -s $HOME/mydotfiles/git/gitconfig ~/.gitconfig
ln -s $HOME/mydotfiles/vim/vimrc ~/.vimrc
ln -s $HOME/mydotfiles/ssh/config $HOME/.ssh/config
ln -s $HOME/mydotfiles/aliases/aliases.sh $HOME/.aliases

# Add juan configs to bashrc
echo 'source $HOME/mydotfiles/bash/bashrc.sh' >> ~/.bashrc

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

wget -O $programsdir/nnn-v5.0.tar.gz -nv https://github.com/jarun/nnn/releases/download/v5.0/nnn-v5.0.tar.gz
tar xf $programsdir/nnn-v5.0.tar.gz -C $programsdir 

LOCAL_BIN=$HOME/.local/bin
if [ ! -d $LOCAL_BIN  ]; then
    mkdir -p $LOCAL_BIN
    echo "Creating local bin folder: $LOCAL_BIN"
fi

echo -e "\n <-----Compiling nnn -----> \n"

# Compile and install nnn
cd $programsdir/nnn-5.0
make O_NERD=1
cp ./nnn $LOCAL_BIN  

# FZF INSTALLATION
##################

echo -e "\n <-----Installing fzf  -----> \n"

git clone --depth 1 https://github.com/junegunn/fzf.git $programsdir/fzf
$programsdir/fzf/install
