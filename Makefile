USER_NAME=emwjacobson
DOCKER_NAME=dockertest
IMAGE_NAME=$(USER_NAME)/$(DOCKER_NAME)
SHA=$(shell git rev-parse --short HEAD)

dockerimage:
	docker build -t $(DOCKER_NAME) .

test:
	docker run --rm -it $(DOCKER_NAME) python3 -m unittest

run:
	docker run --rm -it -p 5000:5000 $(DOCKER_NAME)

deploy:
	echo $(DOCKER_HUB_TOKEN) | docker login -u emwjacobson --password-stdin
	docker tag $(DOCKER_NAME) $(IMAGE_NAME):latest
	docker tag $(DOCKER_NAME) $(IMAGE_NAME):$(SHA)
	docker push $(IMAGE_NAME):latest
	docker push $(IMAGE_NAME):$(SHA)

.PHONY: dockerimage test