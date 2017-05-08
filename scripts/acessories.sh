#!/bin/bash

# Then install some basic stuff
echo "Start with the basics."
sudo apt-get install git vim tmux

# Set things in place
cp $FILES_FOLDER/Vim/.vimrc ~/.vimrc
mkdir ~/.vim/tmpFiles

# Install Vim Plugins with Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# Set Vim as editor for git
git config --global core.editor "vim"
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff

# Instalando editores de texto
echo "Installing some text editors..."

echo -e "\tSublime"
# TO DO:
#   descobrir como baixar pacote sublime com wget
# sudo dpkg -i ./sublime_$ARCHITETURE.deb &>> .log

echo -e "\tAtom"
wget -nv https://atom.io/download/deb -O $TMP_FOLDER$atom &>> .log
sudo dpkg -i $TMP_FOLDER$atom &>> .log

# Instalando ferramentas para dev
echo "Installing dev acessories..."

echo -e "\tFirefox"
sudo apt-get install -y firefox

echo -e "\tFirefox Developer"
wget -nv "https://download.mozilla.org/?product=firefox-aurora-latest-ssl&os=linux$ARCHITETURE" -O $TMP_FOLDER/$firefox_file &>> .log
sudo tar -xjf $TMP_FOLDER/$firefox_file -C $TMP_FOLDER && sudo mv $TMP_FOLDER/firefox /opt/firefox_dev &>> .log
# TO DO:
#   descobrir como copiar o ícone para pasta correta
# cp Firefox\ Developer.desktop ~/Área\ de\ Trabalho/Firefox\ Developer.desktop &>> .log

echo  -e "\tChromium"
sudo apt-get install -y chromium-browser &>> .log

echo -e "\tFilezilla"
sudo apt-get install -y filezilla &>> .log
