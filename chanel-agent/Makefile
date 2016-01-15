#!/usr/bin/make -f
IMAGE := chanel-agent
REGISTRY_SERVER := docker-repo.ifalo.com.tw
VERSION := master

.PHONY: all build rebuild push checkout

.SUFFIXES: chanel-agent

# ------------------------------------------------------------------------------

all: build push

build: checkout
	docker build -t=$(IMAGE):$(VERSION) .

rebuild: checkout
	docker build -t=$(IMAGE):$(VERSION) --no-cache .

push:
	docker tag -f $(IMAGE):$(VERSION) $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)
	docker push $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)

checkout: chanel-agent
	cd chanel-agent; git fetch; git checkout $(VERSION); git reset origin/$(VERSION) --hard
	cd chanel-agent; git submodule update --init

chanel-agent:
	git clone git@gitlab.ifalo.com.tw:web/chanel-agent.git
