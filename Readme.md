

# Read me

## Pre requisites

Before start deploying service there are couple dependencies has to be created:

- networks:

      docker network create -d bridge traefik-net


## Deployment

Deploy compose files using `docker compose` command in following orders:

1. Deploy traefik reverse proxy

        docker compose -f docker-main-compose.yml -p traefik-stack create
        docker compose -f docker-main-compose.yml -p traefik-stack start

2. Deploy portainer

        docker compose -f docker-compose-portainer.yml - portainer-stack create
        docker compose -f docker-compose-portainer.yml - portainer-stack start

3. Deploy postgers

    3.1 Create postgres-net

        docker network create -d bridge postgres-net

    3.2 Create and start containers

        POSTGRES_PASSWORD=<passwd_here> docker compose -f docker-compose-postgres.yml -p postgres-stack create
        POSTGRES_PASSWORD=<passwd_here> docker compose -f docker-comose-postgres.yml -p postgres-stack start

4. Deploy grafana, influx, mosquitto, telegraf

    4.1 Create gitm-net
    
        docker network create -d bridge gitm-net

    4.2 Create and start containers

        docker compose -f docker-compose-gitm.yml -p gitm-stack create
        docker compose -f docker-compose-gitm.yml -p gitm-stack start

5. Deploy homeassistant

        docker compose -f docker-compose-homeassistant.yml -p homeassistant-stack create
        docker compose -f docker-compose-homeassistant.yml -p homeassistant-stack start

6. Deploy mppsolar reader

    6.1 Create config file

    Create mpp-solar.conf file inside volume folder
    
        [SETUP]
        pause=0
        mqtt_broker=mqtt
        mqtt_user=oleksandr
        mqtt_pass=20685ksa
        mqtt_topic=homeassistant

        [Inverter]
        port=/dev/moxa0
        porttype=SERIAL
        protocol=PI30MAX
        command=QPIGS
        tag=QPIGS
        outputs=influx2_mqtt,hass_mqtt

    6.2 Create and start container

        MOXA_CONNECTION_STRING=tcp:192.168.0.9:4001 docker compose -f docker-compose-mppsolar.yml -p mppsolar-stack create
        MOXA_CONNECTION_STRING=tcp:192.168.0.9:4001 docker compose -f docker-compose-mppsolar.yml -p mppsolar-stack start