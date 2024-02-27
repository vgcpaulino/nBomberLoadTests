docker-build:
	@docker-compose build webapi

docker-start:
	@docker-compose up webapi --abort-on-container-exit

docker-test-load:
	@make docker-build && docker-compose up --force-recreate -d webapi
	@docker-compose build webapi-load && docker-compose up webapi-load
	@docker-compose down

restore:
	@dotnet restore

build:
	@dotnet build ./webapi.sln
