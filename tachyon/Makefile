#
#  Author: Hari Sekhon
#  Date: 2016-01-16 12:21:15 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:noet
#
#   /tachyon
#
#    to help improve or steer this or other code I publish
#
#   
#

REPO=harisekhon/tachyon

TAG=$(shell perl -n -e '/^\s*ARG\s+.+_VERSION\s*=\s*(\d+\.\d+)/ && &{ print $$1; exit }' Dockerfile)

ifdef LATEST
	TAG=latest
endif

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO):$(TAG) .

.PHONY: nocache
nocache:
	docker build -t $(REPO):$(TAG) --no-cache .

.PHONY: push
push:
	docker push $(REPO):$(TAG)

.PHONY: run
run:
	docker run -ti -p 19999:19999 -p 30000:30000 $(REPO):$(TAG)
