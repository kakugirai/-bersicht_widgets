#/bin/bash
if command -v git >/dev/null 2>&1 ; then
    echo "Cloning my config files..."
    git clone https://github.com/kakugirai/rc_file.git
else
    echo "git not found"
fi

echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp rc_file/my_ys.zsh-theme ~/.oh-my-zsh/themes/
sed -i -e 's/ZSH_THEME="robbyrussell"/ZSH_THEME="my_ys"/g' ~/.zshrc
echo "Done!"

