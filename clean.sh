docker container rm -f database server-express server-flask traefik
docker network rm test-network
docker volume prune -f