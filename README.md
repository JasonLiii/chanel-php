chanel-php
==========

第一次使用的話：

```
vagrant up
vagrant ssh
cd /vagrant/scripts
sudo sh -x docker.sh
```
 **接下來要登出vagrant並重登入** 
```
exit
vagrant ssh
```

以build member端口為例
=========
```
cd /vagrant/chanel-member
make VERSION=[branch-name]
```