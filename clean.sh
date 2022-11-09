docker container rm -f database server-express server-flask traefik
docker network rm test-network
docker volume prune -f
docker image rm -f $(docker image ls -q | grep -v database | grep -v server-express | grep -v server-flask | grep -v traefik)