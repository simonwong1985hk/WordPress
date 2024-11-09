include .env

all:
	make build
	make download
	make config
	make install

download:
	docker exec -it $(APP_NAME)-php wp core download

config:
	docker exec -it $(APP_NAME)-php wp config create --dbhost=$(DB_HOST) --dbname=$(DB_NAME) --dbuser=$(DB_USER) --dbpass=$(DB_PASSWORD)

install:
	docker exec -it $(APP_NAME)-php wp core install --url=$(WP_URL) --title=$(WP_TITLE) --admin_user=$(WP_ADMIN_USER) --admin_password=$(WP_ADMIN_PASSWORD) --admin_email=$(WP_ADMIN_EMAIL)

build:
	docker compose up -d

rebuild:
	docker compose up -d --build

cli:
	docker exec -it --user root $(APP_NAME)-php /bin/sh
