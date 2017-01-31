#!/usr/bin/env bash

function change_url() {
    link=$1
    modules=("/" "/homebrew-core" "/homebrew-science" "/homebrew-python")
    for module in ${modules[@]}; do
        if [ ${module} = "/" ]; then
            cd $(brew --repo)
            git remote set-url origin "$link/brew.git"
        else
            cd $(brew --repo)/Library/Taps/homebrew${module}
            git remote set-url origin "$link${module}.git"
        fi
    done
}

echo "Where are you?
1) China?
2) rest of the world?"
read location

if [ $location == "1" ]; then
    change_url "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew"
    echo "export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles" >> ~/.zshrc
    echo "WELCOME TO CHINA"
elif [ $location == "2" ]; then
    change_url "https://github.com/Homebrew"
    sed -i ".china" "/HOMEBREW_BOTTLE_DOMAIN/d" ~/.zshrc
    echo "WELCOME TO THE REST OF THE WORLD"
fi

