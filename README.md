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

> Docker 安裝與否可視個人需求，開發主要還是使用 Vagrant

```bash
vagrant ssh

# 切換管理員身份
sudo -i

# 安裝 Docker 相關套件
cd /vagrant/scripts
sh -x docker.sh
```

編輯 `/etc/hosts` 檔

```
10.10.10.10 chanel.biz
10.10.10.10 chanel.us
10.10.10.10 chanel.net
```

網址與工作目錄對應如下：

- `chanel.biz` 對應 `chanel-company/chanel-company/`
- `chanel.us` 對應 `chanel-agent/chanel-agent/`
- `chanel.net` 對應 `chanel-member/chanel-member/`

# 實際的build動作如下

> 以下以build member端口為例

```
cd /vagrant/chanel-member
make VERSION=[branch-name]
```