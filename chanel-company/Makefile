#!/usr/bin/make -f
IMAGE := chanel-company
REGISTRY_SERVER := docker-repo.ifalo.com.tw
VERSION := master

.PHONY: all build rebuild push checkout

.SUFFIXES: chanel-company

# ------------------------------------------------------------------------------

all: build push

build: checkout
	docker build -t=$(IMAGE):$(VERSION) .

rebuild: checkout
	docker build -t=$(IMAGE):$(VERSION) --no-cache .

push:
	docker tag -f $(IMAGE):$(VERSION) $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)
	docker push $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)

checkout: chanel-company
	cd chanel-company; git fetch; git checkout $(VERSION); git reset origin/$(VERSION) --hard
	cd chanel-company; git submodule update --init

chanel-company:
	git clone git@gitlab.ifalo.com.tw:web/chanel-company.git
