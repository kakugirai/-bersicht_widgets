#!/usr/bin/env bash

echo "Where are you?
1) China?
2) rest of the world?"
read location

if [ $location == "1" ]; then
    echo "[global]\nindex-url = https://pypi.tuna.tsinghua.edu.cn/simple" > ~/.pip/pip.conf
elif [ $location == "2" ]; then
    rm ~/.pip/pip.conf
fi

