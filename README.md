# Stepik_6.3
- Docker run postgres
```sh
docker run -d --name postgres -p 5432:5432 -v "/Documents/Studia/Semestr 5/TBK/lab6/zad3/Stepik_6.3/database":/docker-entrypoint-initdb.d -v pg-data:/var/lib/postgresql/data -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres postgres:11.5-alpine
```
- Uruchomienie pozostałych kontenerów 
```sh
start.sh
```
- Uruchomienie traefika
```sh
docker run -d --name traefik -p 8080:8080 -p 80:80 -v /var/run/docker.sock:/var/run/docker.sock traefik:latest --api.insecure=true --providers.docker
```
- Czyszczenie środowiska
```sh
clean.sh
```
Wywoływanie zapytań
- https://api.com/cars - GET - zwraca wszystkie samochody
- https://api.com/cars/<int:year> - GET - zwraca wszystkie samochody z podanego roku
- https://api.com/addCar - POST - dodaje samochód do bazy danych (wymagane pola: model, rok, detale), w Postmanie przykładowy JSON:
```json
{
    "model": "Audi",
    "year": 2010,
    "details": "details"
}
```

