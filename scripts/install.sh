docker compose up -d --build
docker exec united-php-fpm /usr/bin/composer install
docker exec united-php-fpm php artisan key:generate
docker exec united-php-fpm php artisan migrate --seed
docker exec united-php-fpm php artisan clear:all_cache
sudo docker exec -w /var/www/html united-node npm install
sudo docker exec -w /var/www/html united-node npx mix -p