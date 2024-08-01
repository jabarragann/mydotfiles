#!/bin/bash

mydotfiles="$HOME/mydotfiles"
programsdir="$HOME/programs/"
mkdir -v -p $programsdir

# Download nnn 
echo -e "\n <-----Downloading nnn -----> \n"
wget -O $programsdir/nnn-v4.9.tar.gz -nv https://github.com/jarun/nnn/releases/download/v4.9/nnn-v4.9.tar.gz
tar xf $programsdir/nnn-v4.9.tar.gz -C $programsdir 

# Download nerd fonts
echo -e "\n <-----Downloading nerd fonts-----> \n"
local_fonts_dir="$HOME/.local/share/fonts/nerdfonts/"
mkdir -v -p $local_fonts_dir

nerd_fonts_url=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
wget -O $local_fonts_dir/Hack_v3.0.2.zip -nv  $nerd_fonts_url
unzip $local_fonts_dir/Hack_v3.0.2.zip -d $local_fonts_dir/

# Create symbolic links
echo -e " \n <-----Creating symbolic links-----> \n"
ln -s $HOME/mydotfiles/git/gitconfig ~/.gitconfig
ln -s $HOME/mydotfiles/vim/vimrc ~/.vimrc
ln -s $HOME/mydotfiles/ssh/config $HOME/.ssh/config
ln -s $HOME/mydotfiles/aliases/aliases.sh $HOME/.aliases

# Add juan configs to bashrc
echo 'source $HOME/mydotfiles/bash/bashrc.sh' >> ~/.bashrc

# Regenerate font cache
fc-cache -f 
echo | fc-list | grep "Hack"

# Compile and install nnn
make O_NERD=1
mkdir ~/.local/bin
cp ./nnn ~/.local/bin/