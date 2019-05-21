# Makefile for Docker Nginx PHP Composer

APPROOT=/opt/TalentCloud
OPROOT=${APPROOT}/op

build-db:
	php artisan migrate"
	php artisan db:seed"

clean:
	rm -Rf vendor/
	rm -Rf composer.lock
	rm -Rf report/*

env:
	cp ${OPROOT}/.env.example ${APPROOT}/var/www/.env

code-sniff:
	./vendor/bin/phpcs --config-set ignore_errors_on_exit 1
	./vendor/bin/phpcs --config-set ignore_warnings_on_exit 1
	./vendor/bin/phpcs -d memory_limit=512M -v --standard=PSR2 --extensions=php app/

composer-install:
	composer install

npm-install-no-bin-links:
	npm install --no-bin-links

npm-install:
	npm install

npm-dev:
	npm run dev

npm-production:
	npm run production

fake-data:
	php artisan db:seed

fresh-db:
	php artisan migrate:fresh

laravel-init:
	php artisan key:generate

phpmd:
	./vendor/bin/phpmd ./app html codesize,naming,unusedcode --reportfile /opt/TalentCloud/reports/phpmd.xml --ignore-violations-on-exit

phpunit:
	vendor/bin/phpunit --coverage-clover=/opt/TalentCloud/reports/phpunit-coverage-clover.xml --log-junit /opt/TalentCloud/reports/phpunit-junit.xml

test-all: code-sniff phpmd phpunit