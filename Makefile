HELL=/bin/sh

UID:=$(SHELL id -u)
GID:=$(SHELL id -g)

export UID GID

app-setup: app-build app-db-prepare

app-build:
	docker compose build

app-up:
	docker compose up

app-rails-service-ash:
	docker compose run --rm rails-service ash

app-rails-service-console:
	docker compose run --rm rails-service bundle exec rails c

app-rails-service-yarn:
	docker compose run --rm rails-service yarn install

app-rails-service-bundle:
	docker compose run --rm rails-service bundle install

app-annotate-models:
	docker compose run --rm rails-service annotate --models

app-railroady:
	docker compose run --rm rails-service rake diagram:all

app-db-psql:
	docker compose run --rm rails-service psql -d rails-service_development -U postgres -W -h db

app-db-prepare: app-db-drop app-db-create app-db-migrate app-db-seed

app-db-create:
	docker compose run --rm rails-service rails db:create RAILS_ENV=development

app-db-migrate:
	docker compose run --rm rails-service rails db:migrate

app-db-rollback:
	docker compose run --rm rails-service rails db:rollback

app-db-seed:
	docker compose run --rm rails-service rails db:seed

app-db-reset:
	docker compose run --rm rails-service rails db:reset

app-db-drop:
	docker compose run --rm rails-service bin/rails db:environment:set RAILS_ENV=development
	docker compose run --rm rails-service rails db:drop


TEST_PATH := $(or $(TEST_PATH),spec/)
test:
	docker compose run -e DATABASE_URL=postgresql://postgres@db/rails-service_test -e RAILS_ENV=test -e SPEC_DISABLE_FACTORY_LINT=$(SPEC_DISABLE_FACTORY_LINT) -e SPEC_DISABLE_WEBPACK_COMPILE=$(SPEC_DISABLE_WEBPACK_COMPILE) --rm rails-service rspec -f d $(TEST_PATH)

test-db-prepare:
	docker compose run -e DATABASE_URL=postgresql://postgres@db/rails-service_test -e RAILS_ENV=test --rm rails-service rails db:test:prepare

test-db-drop:
	docker compose run -e DATABASE_URL=postgresql://postgres@db/rails-service_test -e RAILS_ENV=test --rm rails-service rails db:drop

.PHONY: app-up test
