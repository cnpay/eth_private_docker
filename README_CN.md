### docker-compose帐户创建问题解决思路(根目录下执行)
(https://github.com/Capgemini-AIE/ethereum-docker.git)

0. 尝试清除files/keystore下的原有文件

1. files下新建password文件
echo "abc125521" > files/password

2. 新建几个测试账户(3个以上吧,做交易的和挖矿的分开)
geth --datadir=./files --password ./files/password account new

3. 启动docker-compose

4. metamastk钱包和web3_api中可以监控