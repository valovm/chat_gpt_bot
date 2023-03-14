# Build Docker Compose services
build:
	docker-compose build

# Start Docker Compose services
start:
	docker-compose up -d

# Stop Docker Compose services
stop:
	docker-compose down

# Restart Docker Compose services
restart:
	docker-compose restart

# Show status of Docker Compose services
ps:
	docker-compose ps
# Show logs of Docker Compose services
logs:
	docker-compose logs -f --tail 10
