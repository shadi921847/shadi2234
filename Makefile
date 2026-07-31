DC ?= docker compose
PNPM ?= pnpm

.PHONY: install dev dev-api dev-web build test seed db-pg db-sqlite docker-up docker-down docker-logs

install:
	$(PNPM) install

dev:
	$(PNPM) dev

dev-api:
	$(PNPM) dev:api

dev-web:
	$(PNPM) dev:web

build:
	$(PNPM) build

test:
	$(PNPM) test

seed:
	$(PNPM) db:seed

db-pg:
	$(PNPM) db:generate:pg

db-sqlite:
	$(PNPM) db:generate:sqlite

docker-up:
	$(DC) up --build

docker-down:
	$(DC) down

docker-logs:
	$(DC) logs -f --tail=200
