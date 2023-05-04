# Include env vars
include .env

# Export them all
export $(shell sed 's/#.*//g; /^$/d; s/=.*//' .env)

# Define the list of environments to deploy
ENVIRONMENTS := development production

# For versioning
TAG_VERSION ?= $(shell git log --format="%h" -n 1)
export TAG_VERSION := $(TAG_VERSION)

# Targets
.PHONY: $(ENVIRONMENTS)

# Pattern rule to build environment-specific containers
build:
	docker compose -f docker-compose.yml -f docker-compose.$(ENVIRONMENT).yml build 

# Target to start environment-specific images
up:
	docker compose -f docker-compose.yml -f docker-compose.$(ENVIRONMENT).yml up -d

down:
	docker compose -f docker-compose.yml -f docker-compose.$(ENVIRONMENT).yml down

logs:
	docker compose -f docker-compose.yml -f docker-compose.$(ENVIRONMENT).yml logs -f

