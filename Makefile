IMAGE_NAME=emwjacobson/dockertest
SHA=$(shell git rev-parse --short HEAD)

dockerimage:
	docker build -t $(IMAGE_NAME):latest .

test:
	docker run --rm -it $(IMAGE_NAME):latest python3 -m unittest

run:
	docker run --rm -it -p 5000:5000 $(IMAGE_NAME):latest

deploy:
	echo $(DOCKER_HUB_TOKEN) | docker login -u emwjacobson --password-stdin
	docker push $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):$(SHA)

.PHONY: dockerimage test