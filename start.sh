cd server-express
docker build . -f Dockerfile -t server-express
cd ../server-flask
docker build . -f Dockerfile -t server-flask
cd ..

#docker run -d --name postgres -p 5432:5432 -v "/Documents/Studia/Semestr 5/TBK/lab6/zad3/Stepik_6.3/database":/docker-entrypoint-initdb.d -v pg-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres postgres:11.5-alpine
sleep 10
docker run -d --name server-express \
        --label traefik.enable=true \
        --label traefik.port=3000 \
        --label traefik.priority=1 \
        --label traefik.http.routers.express.rule="Host(\`api\`)" \
        server-express

docker run -d --name server-flask \
        --label traefik.enable=true \
        --label traefik.port=5000 \
        --label traefik.priority=10 \
        --label traefik.http.routers.flask.rule="Host(\`api\`) && PathPrefix(\`/cars\`)" \
        server-flask

#docker run -d --name traefik -p 8080:8080 -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock traefik:latest --api.insecure=true --providers.docker