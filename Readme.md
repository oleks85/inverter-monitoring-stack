

# Read me

## Pre requisites

Before start deploying service there are couple dependencies has to be created:

- networks:

    ``docker network create -d bridge traefik-net``


## Deployment

Deploy compose files using `docker compose` command in following orders:

1. Deploy traefik reverse proxy

    ``docker compose -f docker-main-compose.yml -p traefik-stack create
    docker compose -f docker-main-compose.yml -p traefik-stack start``

2. Deploy portainer

    >``docker compose -f docker-compose-portainer.yml - portainer-stack create
    docker compose -f docker-compose-portainer.yml - portainer-stack start``

3. Deploy postgers

    3.1 Create postgres-net

    >``docker network create -d bridge postgres-net``

    3.2 Create and start containers

    >``POSTGRES_PASSWORD=<passwd_here> docker compose -f docker-compose-postgres.yml -p postgres-stack create``
    >``POSTGRES_PASSWORD=<passwd_here> docker compose -f docker-comose-postgres.yml -p postgres-stack start``
