#!/usr/bin/make -f
REGISTRY_SERVER := docker-repo.ifalo.com.tw
IMAGE := chanel-php56-apache-base
VERSION := latest

.PHONY: image push

# ------------------------------------------------------------------------------

image:
	docker build -t=$(IMAGE):$(VERSION) .

push:
	docker tag -f $(IMAGE):$(VERSION) $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)
	docker push $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)
	docker rmi $(REGISTRY_SERVER)/$(IMAGE):$(VERSION)
