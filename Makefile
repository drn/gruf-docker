NAME := gruf-docker

default:
	@echo 'Building docker development image ${NAME}:dev'
	docker build -t ${NAME}:dev --build-arg TARGET=development .
