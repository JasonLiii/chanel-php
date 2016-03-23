chanel-php
==========

Requirement
-----------

1. [VirtualBox](https://www.virtualbox.org/)
2. [Vagrant](https://www.vagrantup.com/)

Installation
------------

初始化虛擬機

```bash
cd /path/to/project
vagrant up
```

初始化並不包含 Docker ，如果要安裝 Docker 需執行下面指令：

```bash
vagrant ssh

# 切換管理員身份
sudo -i

# 安裝 Docker 相關套件
cd /vagrant/scripts
sh -x docker.sh
```

# 實際的build動作如下

> 以下以build member端口為例

```
cd /vagrant/chanel-member
make VERSION=[branch-name]
```