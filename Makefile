IMAGE_NAME=emwjacobson/dockertest

dockerimage:
	docker build -t $(IMAGE_NAME):latest .

test: dockerimage
	docker run --rm -it $(IMAGE_NAME):latest python3 -m unittest

deploy: dockerimage
	docker login -u emwjacobson -p $(DOCKER_HUB_TOKEN)
	docker push $(IMAGE_NAME):latest

.PHONY: dockerimage test