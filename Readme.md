# Example on using Makefiles to build Dockerized projects

## Facts
- Have 2 environments
- Use `make` to shorten docker compose commands
- Have an `.env` files to configure the project

## Disclaimer
Using `NodeJS` as an example project to demonstrate the building process; so the `packages-*` and `.js` can be completely ignored and removed. Also check what the `Dockerfile` does.

## Install
- Clone this repo
- Create `.env` file from the `env.example` and tweak it as needed

## Commands
All are ran using the `environment` set in the `.env file`
- `make build`
- `make up`
- `make down`
- `make logs`

## ToDo
- Publish to registry/hub

