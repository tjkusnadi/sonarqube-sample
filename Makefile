-include .env
export $(shell sed 's/=.*//' .env)

PHONY := build

build:
	docker-compose build --no-cache \
	--build-arg SONARQUBE_VERSION=25.9.0.112764-community \
	--build-arg PLUGIN_VERSION=25.9.0

test-js:
	cd sample-js && npm install && npm run test:coverage

scan-js:
	cd sample-js && sonar-scanner -Dsonar.token=$(SONAR_TOKEN)

PHONY += test-js scan-js

test-python:
	cd sample-python && \
	python3 -m venv .venv && \
	source .venv/bin/activate && \
	pip install -r requirements.txt && \
	coverage run -m pytest && \
	coverage report -m && \
	coverage xml

scan-python:
	cd sample-python && sonar-scanner -X -Dsonar.token=$(SONAR_TOKEN)

PHONY += test-python scan-python

test-go:
	cd sample-go && \
	go mod tidy && \
	go test ./src/... -coverprofile=coverage.out

scan-go:
	cd sample-go && sonar-scanner -Dsonar.token=$(SONAR_TOKEN)

PHONY += test-go scan-go

all:
	make test-js
	make scan-js
	make test-python
	make scan-python
	make test-go
	make scan-go

PHONY += all