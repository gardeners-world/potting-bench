PROJECT = $(shell git remote -v | grep origin | grep fetch | sed "s:.*/\(.*\)\.git .*:\1:")
ID = pikesley/${PROJECT}

all: build

build:
	docker build -t ${ID} .

push:
	docker push ${ID}

run:
	docker-compose exec ${PROJECT} bash

