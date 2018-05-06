#!/usr/bin/env bash

# ========================== General =========================
# adduser kakugirai
# usermod -aG sudo kakugirai
# ========================== General =========================
# get my essentials
sudo apt-get update
sudo apt-get install zsh git curl wget build-essential cmake python-dev python3-dev python-pip linux-tools-common linux-tools-generic linux-tools-`uname -r`

# ============================ SSH ===========================
# add my public key
mkdir $HOME/.ssh
chmod 700 $HOME/.ssh
echo "$HOME/.ssh created"
cd $HOME/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCfZ/EX8imJx8ixuvBoQbhGM+joj6M4Oy3fpqe585AwJJAX3Wz1gVxLqsJbEKvYAA6wYqEnyZL7vifyC+lFEiZi1QK+m1H4FJmOa5nYq8+TEFHaY9HkpiHhKhST1U3PU7+1bVpAG7G5GEcb60MLLPZm06Qlq4/tjbIcgetCc9oPqYZYLxMVwsL+h+DAc9srvgb1Z9S1/Nd3AGNUeSy11nP4e0KIX/PX2kWPg5dBWBL3RQOI7xXcPZppZl4Wdsv7y7Z/lfeeYtO8Bh+p/fir+vAzlsRELmX0nBkwFnhK6xMBqHssGhk9fx3HqEu3ve6fL26Oe5F22bkfgSklcNmr9QuaUNMoIlN6TbcOz9sT7C4p3WQAyQvVmwcl1dtxX7o6IO5+E7tkNFzQHsdTFF4WROczYbIFaQblH5TFyuEJ5okrXDrSfj4qRDYqpRLTFTnT+n504egVrEfiTOCUDTGshouCrd930jKktfiUEoTNhchSduFgFdHM+QUeln3jFiyZz2pE4vDBK6HF6fikYjXtl2cUPEZMnqq0JDeN2qxqVlEUgaCDj6mVdbnS3lyqIGLjfQHoeAI39l/bcZaMInqD+2GhOW+eKcRZ1SNe8grcmmVv7DJFDIbmT4qzJsxnFP0XiSBtrgsUQF4NqB2vycCzY1f2H2H5tL/Q+qQuum5+yoPnHw== kakugirai@gmail.com" >> authorized_keys
chmod 644 authorized_keys
echo "public key added"

# ============================ Git ===========================
cp $HOME/dotfiles/gitignore_global $HOME/.gitignore_global
cp $HOME/dotfiles/gitconfig $HOME/.gitconfig

# ============================ VIM ===========================

# Backup
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc ; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc ; do [ -L $i ] && unlink $i ; done
echo "vimrc backup is finished"

read -p "Install vimrc server version (y/n)?" answer
case ${answer:0:1} in
    y|Y )
        cp -r $HOME/dotfiles/vim $HOME/.vim
        cp $HOME/dotfiles/vimrc_server $HOME/.vimrc
        echo "vimrc is installed"
    ;;
    * )
        # Installation
        cp -r $HOME/dotfiles/vim $HOME/.vim
        cp $HOME/dotfiles/vimrc $HOME/.vimrc
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        echo "vimrc is installed"

        # Install vim plugins
        vim -u $HOME/.vimrc +PluginInstall! +PluginClean! +qall
        echo "Vim plugins are installed"

        # Install youcompleteme
        cd $HOME/.vim/bundle/youcompleteme
        ./install.py --clang-completer
        echo "YouCompleteMe is installed"
    ;;
esac


# ============================ zsh ===========================
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "zsh installed"
exit

# install my zsh theme
mkdir -p $HOME/.oh-my-zsh/custom/themes
cp $HOME/dotfiles/lolita.zsh-theme $HOME/.oh-my-zsh/custom/themes/
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="lolita"/g' $HOME/.zshrc
echo "my zsh theme added"

# install zsh-autosuggestions plugin
mkdir -p $HOME/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i '/plugins=(git)/c\plugins=(git z zsh-autosuggestions)' $HOME/.zshrc
echo "zsh plugins added"

# add alias
cat << EOF >> $HOME/.zshrc
alias zshrc="vim $HOME/.zshrc"
alias vimrc="vim $HOME/.vimrc"
EOF
echo "alias added"

