#
#  Author: Hari Sekhon
#  Date: 2016-01-16 12:21:15 +0000 (Sat, 16 Jan 2016)
#
#  vim:ts=4:sts=4:sw=4:noet
#
#   /alpine-dev
#
#    to help improve or steer this or other code I publish
#
#   
#

REPO=harisekhon/alpine-dev

.PHONY: all
all:
	make build

.PHONY: build
build:
	docker build -t $(REPO) .

.PHONY: nocache
nocache:
	docker build -t $(REPO) --no-cache .

.PHONY: push
push:
	docker push $(REPO)

.PHONY: nocache
run:
	docker run -ti $(REPO) bash
