chanel-php
==========

Requirement
-----------

1. [VirtualBox](https://www.virtualbox.org/)
2. [Vagrant](https://www.vagrantup.com/)
3. [Composer](https://getcomposer.org/) (Optional)

> Composer 進 Vagrant 也可使用

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

Clone 三端口程式

```bash
cd /path/to/project/chanel-company
make checkout
cd chanel-company; composer install

cd /path/to/project/chanel-agent
make checkout
cd chanel-agent; composer install

cd /path/to/project/chanel-member
make checkout
cd chanel-member; composer install
```

編輯 `/etc/hosts` 檔，新增下列三行

```
10.10.10.10 chanel.biz
10.10.10.10 chanel.us
10.10.10.10 chanel.net
```

網址與工作目錄對應如下：

- `chanel.biz` 對應 `chanel-company/chanel-company/`
- `chanel.us` 對應 `chanel-agent/chanel-agent/`
- `chanel.net` 對應 `chanel-member/chanel-member/`

編輯三端口 `.env` 檔，可參考 `.env.example` 檔，本機執行的範例如下：

```ini
# Zend Framework 全域環境設定
APPLICATION_ENV=development

# DEBUG Mode
APPLICATION_DEBUG = 1

# 彩球盤口預設Ｂ盤的 id (see lottery_handicap Table)
LOTTERY_B_HANDICAP_ID = 2

# MySQL config
APPLICATION_MYSQL_HOST = 10.10.10.10
APPLICATION_MYSQL_PORT = 3306
APPLICATION_MYSQL_USER = root
APPLICATION_MYSQL_PASS = password
APPLICATION_MYSQL_DB_NAME = default

# Mongo config
APPLICATION_MONGO_HOST = 10.10.10.10
APPLICATION_MONGO_PORT = 27017

# Redis config
APPLICATION_REDIS_HOST = 10.10.10.10
APPLICATION_REDIS_PORT = 6379
APPLICATION_REDIS_PASS = password

# Casino Redis config
APPLICATION_CASINO_REDIS_HOST = 10.10.10.10
APPLICATION_CASINO_REDIS_PORT = 6379
APPLICATION_CASINO_REDIS_PASS = password

# Memcached configs
APPLICATION_MEMCACHED_HOSTS = 10.10.10.10,10.10.10.10,10.10.10.10
APPLICATION_MEMCACHED_PORTS = 11211,11211,11211

# Logger 設定
APPLICATION_LOGGER_ENABLE = 0
APPLICATION_LOGGER_SLACK_TOKEN =
APPLICATION_LOGGER_SLACK_CHANNEL =
APPLICATION_LOGGER_RAVEN_DSN =
APPLICATION_LOGGER_RAVEN_USER =

########### Console 專用 ###########

# 使用 create:admin / create:line 預設會新增的管理員和整線會員，用逗號分隔
# ADMINS=
```

初始化 DB

```bash
cd /path/to/project/chanel-company
php chanel db:reset -f
```

預設管理帳號 admin / password

Docker Image (Optional)
-----------------------

在開始要 Build 三端口 image 之前，需要先 build base

```bash
vagrant ssh
sudo -i

cd /vagrant/chanel-php56-nginx
make build
```

再來就可以 build 三端口的 image

> 以下以 Build member端口為例

```bash
vagrant ssh
sudo -i

cd /vagrant/chanel-member
make build VERSION=[branch-name]
```