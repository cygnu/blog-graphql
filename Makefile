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
log-backend:
	docker compose logs server
log-backend-watch:
	docker compose logs --follow server
log-frontend:
	docker compose logs client
log-frontend-watch:
	docker compose logs --follow client
log-db:
	docker compose logs db
log-db-watch:
	docker compose logs --follow db
backend:
	docker compose exec server /bin/sh
frontend:
	docker compose exec client ash
db:
	docker compose exec db ash
make-migrations:
	docker compose exec server python manage.py makemigrations
migrate:
	docker compose exec server python manage.py migrate
run-server:
	docker compose exec server python manage.py runserver
check:
	docker compose exec server python manage.py check
create-super-user:
	docker compose exec server python manage.py createsuperuser
collect-static:
	docker compose exec server python manage.py collectstatic --no-input --clear
yarn:
	@make yarn-install
yarn-install:
	docker compose exec client yarn install
yarn-start:
	docker compose exec client yarn start
yarn-watch:
	docker compose exec client yarn watch
postgres:
	docker compose exec db psql -U postgres
