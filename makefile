REPO=docker.cosmunity.com/docker/alpine-node

all: upload

build:
	docker build . -t $(REPO)

upload: build
	docker push $(REPO)
