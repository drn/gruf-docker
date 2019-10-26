NAME := gruf-docker

default:
	@echo 'Building docker development image ${NAME}:dev'
	docker build -t ${NAME}:dev --build-arg TARGET=development .
	@echo 'Running ${gruf-docker} in docker'
	docker run -p 50051:50051 gruf-docker:dev
