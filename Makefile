IMAGE = molecularman/alpine-memcached
VERSION = 1.0.0

ifdef CIRCLE_BUILD_NUM
	BUILD_NUM = ${CIRCLE_BUILD_NUM}
else
	BUILD_NUM = $(shell git rev-parse --short HEAD)
endif

build:
	docker build -t $(IMAGE):$(VERSION) .
	docker tag $(IMAGE):$(VERSION) $(IMAGE):$(VERSION)-$(BUILD_NUM)

push:
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker push $(IMAGE):$(VERSION)
	docker push $(IMAGE):$(VERSION)-$(BUILD_NUM)
	docker push $(IMAGE):latest
