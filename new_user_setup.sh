#!/bin/bash


# ============================ Basic ===========================
# add my public key
mkdir ~/.ssh
chmod 700 ~/.ssh
echo "~/.ssh created"
cd ~/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCfZ/EX8imJx8ixuvBoQbhGM+joj6M4Oy3fpqe585AwJJAX3Wz1gVxLqsJbEKvYAA6wYqEnyZL7vifyC+lFEiZi1QK+m1H4FJmOa5nYq8+TEFHaY9HkpiHhKhST1U3PU7+1bVpAG7G5GEcb60MLLPZm06Qlq4/tjbIcgetCc9oPqYZYLxMVwsL+h+DAc9srvgb1Z9S1/Nd3AGNUeSy11nP4e0KIX/PX2kWPg5dBWBL3RQOI7xXcPZppZl4Wdsv7y7Z/lfeeYtO8Bh+p/fir+vAzlsRELmX0nBkwFnhK6xMBqHssGhk9fx3HqEu3ve6fL26Oe5F22bkfgSklcNmr9QuaUNMoIlN6TbcOz9sT7C4p3WQAyQvVmwcl1dtxX7o6IO5+E7tkNFzQHsdTFF4WROczYbIFaQblH5TFyuEJ5okrXDrSfj4qRDYqpRLTFTnT+n504egVrEfiTOCUDTGshouCrd930jKktfiUEoTNhchSduFgFdHM+QUeln3jFiyZz2pE4vDBK6HF6fikYjXtl2cUPEZMnqq0JDeN2qxqVlEUgaCDj6mVdbnS3lyqIGLjfQHoeAI39l/bcZaMInqD+2GhOW+eKcRZ1SNe8grcmmVv7DJFDIbmT4qzJsxnFP0XiSBtrgsUQF4NqB2vycCzY1f2H2H5tL/Q+qQuum5+yoPnHw== kakugirai@gmail.com" >> authorized_keys
chmod 644 authorized_keys
echo "public key added"


# ============================ ZSH ===========================
# install oh-my-zsh
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
echo "zsh installed"

# install my zsh theme
mkdir -p ~/.oh-my-zsh/custom/themes
cp ~/dotfiles/my_ys.zsh-theme ~/.oh-my-zsh/custom/themes/
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="my_ys"/g' ~/.zshrc
echo "my zsh theme added"

# install zsh-autosuggestions plugin
mkdir -p ~/.oh-my-zsh/custom/plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i '/plugins=(git)/c\plugins=(git z zsh-autosuggestions)' ~/.zshrc
echo "zsh plugins added"

# add alias
cat << EOF >> ~/.zshrc
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
EOF
echo "alias added"

# ============================ VIM ===========================

cd ~/dotfiles
CURRENT_DIR=`pwd`

# Backup
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc ; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc ; do [ -L $i ] && unlink $i ; done
echo "finish current vim config backup"

# Add symlinks
lnif $CURRENT_DIR/vimrc $HOME/.vimrc
lnif $CURRENT_DIR/gvimrc $HOME/.gvimrc
lnif "$CURRENT_DIR/vim" "$HOME/.vim"
echo "symlinks added"
# Install plugins
vim -u $HOME/.vimrc +PluginInstall! +PluginClean! +qall
echo "plugin installed"
