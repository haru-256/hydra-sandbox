.PHONY: help lint fmt install
.DEFAULT_GOAL := help

lint: ## Run Linter
	pipenv run ruff check

fmt: ## Run formatter
	pipenv run ruff check --fix
	pipenv run ruff format

install: ## Install dependencies
	pipenv lock --dev
	pipenv sync --dev

run: ## Run the application
	pipenv run python src/main.py

help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done
