build:
	docker compose --file docker-compose.yaml build --force-rm --no-cach
up:
	docker compose --file docker-compose.yaml up --detach
ps:
	docker compose ps
images:
	docker compose images
stop:
	docker compose --file docker-compose.yaml stop
down:
	docker compose --file docker-compose.yaml down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker compose --file docker-compose.yaml down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker compose --file docker-compose.yaml down --volumes --remove-orphans
logs:
	docker compose logs
logs-watch:
	docker compose logs --follow
log-frontend:
	docker compose logs client
log-frontend-watch:
	docker compose logs --follow client
frontend:
	docker compose exec client ash
yarn:
	@make yarn-install
yarn-install:
	docker compose exec client yarn install
yarn-start:
	docker compose exec client yarn start
yarn-watch:
	docker compose exec client yarn watch
