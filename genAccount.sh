#!/bin/bash

# 安装 pacman -S moreutils 

# 注意shell之for循环范围不需要seq

# 单引号内出现单引号的方法不能用\',可以借助"水平拼接

function genAccout(){
    for x in {1..5};do
       echo $x
       address=$(geth --datadir=./files --password <(echo "abc125521") account new | sed -e 's/Address: {//g' -e 's/}//g')
       command=".alloc.\"$address\".balance=\"20000000000000000000\""
       echo $command
       eval 'jq '"'""$command""'" "files/genesis.json | sponge files/genesis.json"
    done;
}

genAccout
