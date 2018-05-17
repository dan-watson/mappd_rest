build:
	docker-compose build
guard:
	docker-compose run ruby guard
rspec:
	docker-compose run ruby rspec
lint:
	docker-compose run ruby rubocop
bash:
	docker-compose run ruby bash
release:

