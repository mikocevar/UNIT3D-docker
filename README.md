# UNIT3D-docker
A docker compose setup for UNIT3D tracker

This is a docker-compose.yml file which combines all the necessary containers to run the UNIT3D tracker.

To install, run the script in scripts/install.sh: 

```bash
bash scripts/install.sh
```

I currently don't know why, but if it fails, rerun the install script or manually run:

```bash
docker exec united-php-fpm php artisan migrate --seed
```

Link to the github repository of the tracker: https://github.com/HDInnovations/UNIT3D-Community-Edition
