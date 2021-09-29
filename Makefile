up:
	docker compose --file docker-compose.yaml up --detach
ps:
	docker compose ps
images:
	docker compose images
logs:
	docker compose logs
down:
	docker compose --file docker-compose.yaml down --rmi all
