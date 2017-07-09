.PHONY: all
all: build push

.PHONY: build
build:
	docker build --squash --tag akabos/golang:latest .

.PHONY: push
push:
	docker push akabos/golang
