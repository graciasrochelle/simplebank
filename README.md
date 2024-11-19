## Docker
### Useful docker commands:
```
$ docker pull postgres
$ docker run --name golang-project -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:latest
$ docker ps
$ docker exec -it golang-project psql -U root
$ docker logs golang-project
$ docket stop golang-project
$ docker ps -a
$ docker start golang-project
$ docker exec -it golang-project /bin/sh
$ docker exec -it golang-project createdb --username=root --owner=root golang-project
$ docker exec -it golang-project psql -U root simple_bank
```
## Makefile
` $ make dropdb`

` $ make createdb`

` $ history | grep "docker run"`

## Migrate db schema
```
$ migrate create -ext sql -dir db/migration -seq init_schema
```
## Generate CRUD golang code from sql
### SQLC
> only supports postgres
 
 `$ make sqlc`

 ## Misc commands
 
 `$ go mod init simplebank`

 `$ go mod tidy`

 ## Docker file

`$ docker build -t simplebank:latest .`

`$ docker run --rm -it --entrypoint bash simplebank:latest `

`$ docker run --name simplebank --network bank-network -e GIN_MODE=release -e DB_SOURCE="postgres://root:secret@golang-project:5432/simple_bank?sslmode=disable" -p 8080:8080 simplebank:latest`

`$ docker compose up`

`$ docker compose down`

`$ docker rmi simplabank_api`