FIG=docker-compose
RUN_MINECRAFT=$(FIG) run --rm minecraft
EXEC_MINECRAFT=$(FIG) exec minecraft

.DEFAULT_GOAL := help
.PHONY: help build install up start stop

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

##
## Project setup
##---------------------------------------------------------------------------

build:          ## Build the Docker image
build:
	$(FIG) build

start:          ## Install the full project (build install up)
start: build up

stop:           ## Stop containers
stop:
	$(FIG) kill
	$(FIG) rm -v --force

up:             ## Run images
up:
	docker-compose up

debug:          ## Debug container
debug:
	$(EXEC_MINECRAFT) bash