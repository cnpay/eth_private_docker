### docker-compose帐户创建问题解决思路(根目录下执行)
(https://github.com/Capgemini-AIE/ethereum-docker.git)

0. 尝试清除files/keystore下的原有文件

1. files下新建password文件
echo "abc125521" > files/password

2. 新建几个测试账户(3个以上吧,做交易的和挖矿的分开)
geth --datadir=./files --password ./files/password account new
geth --datadir=./files --password <(echo "abc125521") account new >address.txt
geth --datadir=./files --password <(echo "abc125521") account new | sed -e 's/Address: {//g' -e 's/}//g'
jq '.alloc."0x007ccffb7916f37f7aeef05e8096ecfbe55asdfadsf".balance="20000000000000000000"' genesis.json | sponge genesis.json

以上综合执行：./genAccount.sh

3. 启动
docker-compose up

4. metamastk钱包和web3_api中可以监控