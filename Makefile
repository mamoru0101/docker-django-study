ENV=develop

pre:
ifdef e
ENV=${e}
endif

set-env := export ENV=$(ENV);\
           export COMPOSE_FILE=docker-compose.yml:docker-compose.$(ENV).yml;


buildup: pre
	$(set-env) \
	docker-compose up --build -d

rebuild_nocache: pre
	$(set-env) \
	docker-compose build --no-cache

up: pre
	$(set-env) \
	docker-compose up -d


down: pre
	$(set-env) \
	docker-compose down
