#!/usr/bin/make -f
REGISTRY_SERVER := docker-repo.ifalo.com.tw
IMAGE := $(shell basename $(shell pwd))
VERSION := latest

.PHONY: all build push

# ------------------------------------------------------------------------------

all: build push

build:
	docker build -t=$(REGISTRY_SERVER)/$(IMAGE):$(VERSION) .

push:
	docker push $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)
