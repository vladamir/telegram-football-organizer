build-initial:
	docker build --rm -t valarmorghuliis/php:8.2.2-fpm-alpine3.17 -f ./build/app/Dockerfile.initial .
	docker push valarmorghuliis/php:8.2.2-fpm-alpine3.17

build-app:
	docker build --rm -t valarmorghuliis/telegram-football-organizer:latest -f ./build/app/Dockerfile .
	docker push valarmorghuliis/telegram-football-organizer:latest
