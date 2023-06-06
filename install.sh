#!/bin/bash

mydotfiles="$HOME/mydotfiles"
programsdir="$HOME/programs/"
mkdir -v -p $programsdir

#Download nnn 
echo -e "\n <-----Downloading nnn -----> \n"
wget -O $programsdir/nnn-v4.8.tar.gz -nv https://github.com/jarun/nnn/releases/download/v4.8/nnn-v4.8.tar.gz
tar xf $programsdir/nnn-v4.8.tar.gz -C $programsdir 

#Download nerd fonts
echo -e "\n <-----Downloading nerd fonts-----> \n"
local_fonts_dir="$HOME/.local/share/fonts/nerdfonts/"
mkdir -v -p $local_fonts_dir

# Old url don't work any more
# nerd_fonts_mono_url=https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
# nerd_fonts_url=https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
# wget -O $local_fonts_dir/hack_regular_nerd_font_complete_mono.ttf -nv $nerd_fonts_mono_url 
# wget -O $local_fonts_dir/hack_regular_nerd_font_complete.ttf -nv  $nerd_fonts_url

nerd_fonts_mono_url=https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/HackNerdFontMono-Regular.ttf 
nerd_fonts_url= https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/HackNerdFont-Regular.ttf 
wget -O $local_fonts_dir/HackNerdFontMono-Regular.ttf -nv $nerd_fonts_mono_url 
wget -O $local_fonts_dir/HackNerdFont-Regular.ttf -nv  $nerd_fonts_url

# Create symbolic links
echo -e "<-----Creating symbolic links-----> \n"
ln -s $HOME/mydotfiles/git/gitconfig ~/.gitconfig
ln -s $HOME/mydotfiles/vim/vimrc ~/.vimrc
ln -s $HOME/mydotfiles/ssh/config $HOME/.ssh/config
ln -s $HOME/mydotfiles/aliases/aliases.sh $HOME/.aliases

# Add juan configs to bashrc
echo 'source $HOME/mydotfiles/bash/bashrc.sh' >> ~/.bashrc

# Regenerate font cache
fc-cache -f 
echo | fc-list | grep "Hack"
