#!/usr/bin/make
# Makefile readme (ru): <http://linux.yaroslavl.ru/docs/prog/gnu_make_3-79_russian_manual.html>
# Makefile readme (en): <https://www.gnu.org/software/make/manual/html_node/index.html#SEC_Contents>

SHELL = /bin/sh

# APP_CONTAINER_NAME := app
DB_CONTAINER_NAME := db1
BACKUP_NAME := db

# docker_bin := $(shell command -v docker 2> /dev/null)
# docker_compose_bin := $(shell command -v docker-compose 2> /dev/null)

.PHONY : help init backup restore

.DEFAULT_GOAL := help

# This will output the help for each task. thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
help: ## Show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo "\n  Allowed for overriding next properties:\n\n\
	  Usage example:\n\
	    make restore"

# --- [ Application ] -------------------------------------------------------------------------------------------------

init: restore
	@echo "init exec"

restore:
	@echo "start restoring database"
	docker exec -it $(DB_CONTAINER_NAME) sh -c "mysql -u root -p123 db < /backup/$(BACKUP_NAME).sql"

