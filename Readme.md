

# Read me

## Pre requisites

Before start deploying service there are couple dependencies has to be created:

- networks:

    ``docker network create -d bridge traefik-net``


## Deployment

Deploy compose files using `docker compose` command in following orders:

1. Deploy traefik reverse proxy

    ``docker compose -f docker-main-compose.yml
    docker``

2. Deploy portainer

    ``docker compose -f docker-compose-portainer.yml``

