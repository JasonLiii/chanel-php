#!/usr/bin/make -f
REGISTRY_SERVER := docker-repo.ifalo.com.tw
IMAGE := $(shell basename $(shell pwd))
VERSION := master

.PHONY: all build rebuild push checkout

.SUFFIXES: chanel-agent

# ------------------------------------------------------------------------------

all: build push

build: checkout
	docker build -t=$(REGISTRY_SERVER)/$(IMAGE):$(VERSION) .

rebuild: checkout
	docker build -t=$(REGISTRY_SERVER)/$(IMAGE):$(VERSION) --no-cache .

push:
	docker push $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)

checkout: chanel-agent
	cd chanel-agent; git fetch; git checkout $(VERSION); git reset origin/$(VERSION) --hard
	cd chanel-agent; git submodule update --init

chanel-agent:
	git clone git@github.com:ifaloteam/chanel-agent.git
