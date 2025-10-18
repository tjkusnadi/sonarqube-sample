-include .env
export $(shell sed 's/=.*//' .env)

PHONY: build scan-js scan-python scan-go

build:
	docker-compose build --no-cache \
	--build-arg SONARQUBE_VERSION=25.9.0.112764-community \
	--build-arg PLUGIN_VERSION=25.9.0

scan-js:
	cd sample-js && sonar-scanner -Dsonar.token=$(SONAR_TOKEN)

scan-python:
	cd sample-python && sonar-scanner -X -Dsonar.token=$(SONAR_TOKEN)

scan-go:
	cd sample-go && sonar-scanner -Dsonar.token=$(SONAR_TOKEN)