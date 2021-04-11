ENV=dev

pre:
ifdef e
ENV=${e}
endif

setservice:
ifdef service
SERVICE=${service}
endif

set-env := export ENV=$(ENV);\
           export COMPOSE_FILE=docker-compose.yml:./dc/$(ENV).yml;


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

downv: pre
	$(set-env) \
	docker-compose down -v

enterconsole: setservice
	$(set-env) \
	docker-compose exec $(SERVICE) bash