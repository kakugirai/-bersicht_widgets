sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir ~/.oh-my-zsh/custom/themes
cp ~/dotfiles/my_ys.zsh-theme ~/.oh-my-zsh/custom/themes/
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="my_ys"/g' ~/.zshrc
