git clone https://github.com/HDInnovations/UNIT3D-Community-Edition.git www
cp unit3d/.env www

docker compose stop
docker container rm $(docker container ps -aq)
docker compose build

docker run --rm -d -v $(pwd)/www:/var/www/html --name united-php-fpm united_docker-php-fpm
docker exec -i united-php-fpm

docker run --rm -v $(pwd)/www:/var/www/html -w /var/www/html node:16 npm install
docker run --rm -v $(pwd)/www:/var/www/html -w /var/www/html node:16 npx mix -p

docker stop united-php-fpm
docker container rm $(docker container ps -aq)

docker compose up -d

docker exec -i united-php-fpm php artisan clear:all_cache
docker exec -i united-php-fpm php artisan key:generate
docker exec -i united-php-fpm php artisan migrate --seed
docker exec -i united-php-fpm php artisan clear:all_cache