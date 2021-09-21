<!-- https://www.digitalocean.com/community/tutorials/containerizing-a-ruby-on-rails-application-for-development-with-docker-compose -->

# Docker bash
docker exec -it starecow_pg sh
docker exec -it starecow_app sh

# db
psql -U postgres
\l # show tabases
\c # connect db
\dt # show tables
goes more here: https://www.postgresqltutorial.com/postgresql-show-tables/
docker-compose exec app bundle exec rake db:setup db:migrate

step:
1. pull image
2. create .env
DATABASE_NAME=starecow_development
DATABASE_USER=drine
DATABASE_PASSWORD=z4cEXD13GdDpLqGRPEtP
DATABASE_HOST=database
REDIS_HOST=redis
SECRET_KEY_BASE=xxx
3. make dbmigrate to init the db