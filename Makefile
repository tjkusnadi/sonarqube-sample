PHONY: build

build:
	docker-compose build --no-cache \
	--build-arg SONARQUBE_VERSION=25.9.0.112764-community \
	--build-arg PLUGIN_VERSION=25.9.0

scan-js:
	cd sample-js && sonar-scanner -Dsonar.token=$(SONAR_TOKEN)