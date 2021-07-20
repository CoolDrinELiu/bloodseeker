COMPOSE = docker-compose

start:
	@${COMPOSE} up -d
stop-all:
	@${COMPOSE} stop
        
