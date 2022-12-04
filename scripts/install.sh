git clone https://github.com/HDInnovations/UNIT3D-Community-Edition.git www
cp unit3d/.env www

docker compose build

docker run --rm -d --name united-mariadb united_docker-mariadb
docker run --rm -d -v $(pwd)/www:/var/www/html --name united-php-fpm united_docker-php-fpm
docker exec -it united-php-fpm composer install
docker exec -it united-php-fpm php artisan key:generate
docker exec -it united-php-fpm php artisan migrate --seed
docker exec -it united-php-fpm php artisan clear:all_cache

docker run --rm -d -v $(pwd)/www:/var/www/html --name united-node united_docker-node
docker exec -it united-node npm install
docker exec -it united-node npx mix -p

docker stop united-php-fpm
docker stop united-mariadb
docker stop united-node

docker container rm $(docker container ps -aq)

docker compose stop
docker compose up