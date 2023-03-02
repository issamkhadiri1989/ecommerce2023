VERSION=6.2.*
TARGET=store # can hold store or admin keys

# Install the project from scratch
install:
	rm -Rf $(TARGET)
	mkdir $(TARGET)
	docker-compose build --force-rm
	docker-compose up -d --force-recreate --remove-orphans

webapp:
	docker-compose exec $(TARGET) symfony new . --version=$(VERSION) --webapp

# Get in the `store` container
enter:
	docker-compose exec $(TARGET) bash

# Stop all containers
stop:
	docker container stop $$(docker container ps -aq)

# Start all containers
start:
	docker-compose up -d --no-recreate --remove-orphans

# List all containers
ps:
	docker-compose ps