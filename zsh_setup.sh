# install oh-my-zsh
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install my theme
mkdir $ZSH_CUSTOM/themes
cp ~/dotfiles/my_ys.zsh-theme $ZSH_CUSTOM/themes/
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="my_ys"/g' ~/.zshrc

# install zsh-autosuggestions plugin
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
cat << EOF >> ~/.zshrc
plugins+=(z zsh-autosuggestions)
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
EOF

