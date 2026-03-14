# globals
DC = docker compose
PHP_CONTAINER ?= php
DB_CONTAINER ?= db

.PHONY: up upb down restart logs php db console composer cc cs stan ark test ci

# docker
up:
	@$(DC) up -d

upb:
	@$(DC) up -d --build

down:
	@$(DC) down

restart:
	@$(MAKE) down --remove-orphans
	@$(MAKE) up

logs:
	@$(DC) logs -f

php:
	@$(DC) exec $(PHP_CONTAINER) bash

db:
	@$(DC) exec $(DB_CONTAINER) bash

# symfony
console:
	@$(DC) exec $(PHP_CONTAINER) bin/console

composer:
	@$(DC) exec $(PHP_CONTAINER) composer

cc:
	@$(MAKE) console cmd="cache:clear"

cs:
	@$(DC) exec $(PHP_CONTAINER) vendor/bin/php-cs-fixer fix

stan:
	@$(DC) exec $(PHP_CONTAINER) vendor/bin/phpstan analyze

ark:
	@$(DC) exec $(PHP_CONTAINER) vendor/bin/phparkitect check

test:
	@$(DC) exec $(PHP_CONTAINER) vendor/bin/phpunit

ci:
	@$(MAKE) cs
	@$(MAKE) stan
	@$(MAKE) ark
	@$(MAKE) test
