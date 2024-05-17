# docker-h2

Dockerized H2 database for ARM-64 architechtures.

## Features

- Using [h2database/2.2.224](https://github.com/h2database/h2database/releases/tag/version-2.2.224)
- Using `openjdk:20`.
- Only packing H2 jar-file into Docker image (retrieved from Maven Central).
- H2-DATA location on `/h2-data`.
- Exposing default ports `8082` / `9092`.

## Trusted Builds

[Automated builds](https://hub.docker.com/r/jdoconnell/h2/) on [docker registry](https://registry.hub.docker.com/):

* [`latest`, `1.0.0` (*1.0.0/Dockerfile*)](https://github.com/oconnellj2/docker-h2/blob/master/1.0.0/Dockerfile)

## Running

Get the image:
```bash
docker pull jdoconnell/h2:latest
```

Run as a service, exposing ports 9092 (TCP database server) and 8082 (web interface) and mapping DATA_DIR to host:
```bash
docker run -d -p 9092:9092 -p 8082:8082 -v /path/to/local/h2-data:/h2-data --name=myH2Server jdoconnell/h2
```

compose.yaml:
```yaml
services:
  db:
    image: "jdoconnell/h2:latest"
    ports:
      - 9092:9092
    volumes:
      - h2-data:/opt/h2-data
volumes:
  h2-data:
    driver: local
```