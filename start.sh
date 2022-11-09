docker network create test-network

cd database
docker build . -f Dockerfile -t database
cd ../server-express
docker build . -f Dockerfile -t server-express
cd ../server-flask
docker build . -f Dockerfile -t server-flask
cd ..

docker run -d --name database --network test-network -p 5432:5432 database
sleep 10
docker run -d --name server-express \
        --network test-network -p 3000:3000 \
        --label traefik.enable=true \
        --label traefik.port=3000 \
        --label traefik.priority=1 \
        server-express

docker run -d --name server-flask \
       --network test-network -p 5000:5000\
       --label traefik.enable=true \
       --label traefik.port=5000 \
       --label traefik.priority=1 \
       server-flask

#docker run traefik
docker run -d --name traefik -p 8080:8080 -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock traefik:latest --api.insecure=true --providers.docker