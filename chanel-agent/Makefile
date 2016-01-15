#!/usr/bin/make -f
IMAGE := chanel-agent
REGISTRY_SERVER := docker-repo.ifalo.com.tw
VERSION := latest

.PHONY: all build rebuild push

# ------------------------------------------------------------------------------

all: build push

build:
	docker build -t=$(IMAGE):$(VERSION) .

rebuild:
	docker build -t=$(IMAGE):$(VERSION) --no-cache .

push:
	docker tag -f $(IMAGE):$(VERSION) $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)
	docker push $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)
