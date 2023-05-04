# Define the list of environments to deploy
ENVIRONMENTS := development production

# Username on Docker Registry / Hub to push to
DOCKER_REPOSITORY ?= username

# Name your project
PROJECT_NAME ?= hola-mundo

# For versioning
TAG_VERSION ?= $(shell git log --format="%h" -n 1)

# --

.PHONY: $(ENVIRONMENTS)

# Pattern rule to deploy environment-specific containers
$(ENVIRONMENTS):
	docker compose -f docker-compose.yml -f docker-compose.$@.yml build 

# Target to start environment-specific images
up:
	docker compose -f docker-compose.yml -f docker-compose.$(ENV).yml up -d

down:
	docker compose -f docker-compose.yml -f docker-compose.$(ENV).yml down

logs:
	docker compose -f docker-compose.yml -f docker-compose.$(ENV).yml logs -f

# Set default environment to "development" if not specified
ENV ?= development

