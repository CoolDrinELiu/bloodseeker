COMPOSE = docker-compose
RAKE = ${COMPOSE} exec app bundle exec rake
RUN  = ${COMPOSE} run

run:
	@${COMPOSE} exec app bundle exec
start:
	@${COMPOSE} up -d
update:
	@${RUN} app /bin/sh -c "yarn install && bundle exec rake assets:precompile RAILS_ENV=production"
	@${COMPOSE} stop
	@${COMPOSE} up -d
restart:
	@${COMPOSE} stop
	@${COMPOSE} start
stop:
	@${COMPOSE} stop
rakedb:
	@${COMPOSE} exec app bundle exec rake db:migrate
rollback:
	@${COMPOSE} exec app bundle exec rake db:rollback
clean:
	@echo "Clean Docker images..."
	@docker ps -aqf status=exited | xargs docker rm && docker images -qf dangling=true | xargs docker rmi
