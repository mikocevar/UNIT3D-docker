#!/bin/bash

git clone https://github.com/HDInnovations/UNIT3D-Community-Edition.git www
cp unit3d/.env www

docker compose stop
docker container rm $(docker container ps -aq)
docker compose --project-name united build

docker run --rm -v $(pwd)/www:/var/www/html -w /var/www/html united-php-fpm composer install
docker run --rm -v $(pwd)/www:/var/www/html -w /var/www/html node:16 npm install
docker run --rm -v $(pwd)/www:/var/www/html -w /var/www/html node:16 npx mix -p

docker container rm $(docker container ps -aq)

docker compose up -d

bash -c 'while [[ $(docker exec united-php-fpm /bin/bash -c whoami) != "root" ]] > /dev/null; do echo waiting for united-php-fpm container to start; sleep 3; done'
bash -c 'while [[ $(docker exec united-mariadb /bin/bash -c whoami) != "root" ]] > /dev/null; do echo waiting for united-mariadb container to start; sleep 3; done'

docker exec united-php-fpm php artisan clear:all_cache
docker exec united-php-fpm php artisan key:generate
docker exec united-php-fpm php artisan migrate --seed
docker exec united-php-fpm php artisan clear:all_cache