#!/bin/bash

LOCAL_BIN=$HOME/.local/bin
mydotfiles="$HOME/mydotfiles"
programsdir="$HOME/programs/"

# Make tools installed in LOCAL_BIN (e.g. nnn) visible to the rest of this script
export PATH="$LOCAL_BIN:$PATH"

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
## -n option is needed to prevent weird behaviours when symlinking the folder
ln -snf $HOME/mydotfiles/kitty/custom $HOME/.config/kitty/kitty_custom

# Not secure to store ssh keys in public repo.
# ln -s $HOME/mydotfiles/ssh/config $HOME/.ssh/config

# Add juan configs to bashrc
echo 'source $HOME/mydotfiles/bash/bashrc.sh' >> ~/.bashrc

# NVIM 
#####################
git clone git@github.com:jabarragann/neovim_config.git ~/.config/nvim

# or 
# git clone https://github.com/jabarragann/nvim_config.git ~/.config/nvim

# Use v0.11.5 for Ubuntu 24.04. Use v0.10.4 for Ubuntu 20.04
NVIM_VER="v0.11.5" 
wget -O "${programsdir}/nvim-${NVIM_VER}.tar.gz" "https://github.com/neovim/neovim/releases/download/${NVIM_VER}/nvim-linux-x86_64.tar.gz"
mkdir -p "${programsdir}/nvim-${NVIM_VER}"
tar -xf "${programsdir}/nvim-${NVIM_VER}.tar.gz" -C "${programsdir}/nvim-${NVIM_VER}"
ln -sf "${programsdir}/nvim-${NVIM_VER}/nvim-linux-x86_64/bin/nvim" "$LOCAL_BIN/nvim"


# LSP for NVIM
#####################
MARKSMAN_VERSION=2026-02-08
wget -O "${programsdir}/marksman_${MARKSMAN_VERSION}" "https://github.com/artempyanykh/marksman/releases/download/${MARKSMAN_VERSION}/marksman-linux-x64"
chmod +x "${programsdir}/marksman_${MARKSMAN_VERSION}"
ln -sf "${programsdir}/marksman_${MARKSMAN_VERSION}" "$LOCAL_BIN/marksman"

# ZSH TOOLS
############

mkdir -v -p $HOME/.zsh/plugins
git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.zsh/plugins/zsh-vi-mode


# INSTALL NERD FONTS
#####################

echo -e "\n <-----Downloading nerd fonts-----> \n"
local_fonts_dir="$HOME/.local/share/fonts/nerdfonts/"
mkdir -v -p $local_fonts_dir

nerd_fonts_url=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip
wget -O $local_fonts_dir/Hack_v3.0.2.zip -nv  $nerd_fonts_url
unzip $local_fonts_dir/Hack_v3.0.2.zip -d $local_fonts_dir/

# Regenerate font cache
fc-cache -f 
echo | fc-list | grep "Hack"

# NNN INSTALLATION
##################
echo -e "\n <-----Downloading nnn -----> \n"
nnn_version="5.3" ## Blue Hawaii
wget -O $programsdir/nnn-v${nnn_version}.tar.gz -nv https://github.com/jarun/nnn/releases/download/v${nnn_version}/nnn-v${nnn_version}.tar.gz
tar xf $programsdir/nnn-v${nnn_version}.tar.gz -C $programsdir 


echo -e "\n <-----Compiling nnn -----> \n"

# Compile and install nnn
cd $programsdir/nnn-${nnn_version}
make O_NERD=1
ln -sf $programsdir/nnn-${nnn_version}/nnn $LOCAL_BIN 

# NNN PLUGINS 
##################
# pull plugins from the official repository
echo -e "\n <-----Downloading nnn plugins -----> \n"
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
# copy plugins from my repository
bash $HOME/mydotfiles/update_nnn_local_plugins.sh


# FZF INSTALLATION
##################

echo -e "\n <-----Installing fzf  -----> \n"

git clone --depth 1 https://github.com/junegunn/fzf.git $programsdir/fzf
$programsdir/fzf/install
