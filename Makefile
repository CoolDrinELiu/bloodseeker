COMPOSE = docker-compose
RAKE = ${COMPOSE} exec app bundle exec rake

run:
	@${COMPOSE} exec app bundle exec
start:
	@${COMPOSE} up -d
stop:
	@${COMPOSE} stop
rakedb:
	@${COMPOSE} exec app bundle exec rake db:migrate
rollback:
	@${COMPOSE} exec app bundle exec rake db:rollback
clean:
	@echo "Clean Docker images..."
	@docker ps -aqf status=exited | xargs docker rm && docker images -qf dangling=true | xargs docker rmi
