#!/usr/bin/make -f
REGISTRY_SERVER := docker-repo.ifalo.com.tw
IMAGE := chanel-php56-nginx
VERSION := latest

.PHONY: build push

# ------------------------------------------------------------------------------

all: build push

build:
	docker build -t=$(IMAGE):$(VERSION) .

push:
	docker tag -f $(IMAGE):$(VERSION) $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)
	docker push $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)
