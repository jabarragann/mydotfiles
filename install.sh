#!/bin/bash

mydotfiles="$HOME/mydotfiles"

#Download nerd fonts
nerd_fonts_mono_url=https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
nerd_fonts_url=https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
wget -O $HOME/temp/hack_regular_nerd_font_complete_mono.ttf -nv $nerd_fonts_mono_url 
wget -O $HOME/temp/hack_regular_nerd_font_complete.ttf -nv  $nerd_fonts_url

# Create symbolic links
ln -s $HOME/mydotfiles/git/gitconfig ~/.gitconfig
ln -s $HOME/mydotfiles/vim/vimrc ~/.vimrc

