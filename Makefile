IMAGE_NAME=emwjacobson/dockertest

dockerimage:
	docker build -t $(IMAGE_NAME):latest .

test: dockerimage
	docker run --rm -it $(IMAGE_NAME):latest python3 -m unittest

deploy: dockerimage
	echo $(DOCKER_HUB_TOKEN) | docker login -u emwjacobson --password-stdin
	docker push $(IMAGE_NAME):latest

.PHONY: dockerimage test