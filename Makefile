IMAGE_NAME=test

dockerbuild:
	docker build -t $(IMAGE_NAME):latest .

test: dockerbuild
	docker run --rm -it $(IMAGE_NAME):latest python3 -m unittest

.PHONY: dockerbuild test