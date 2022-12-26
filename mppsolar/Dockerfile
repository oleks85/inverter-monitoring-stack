FROM python:slim

RUN set -eux; \
        apt-get update; \
        apt-get install -y git build-essential libglib2.0-dev libsystemd-dev; \
        pip install systemd-python; \
        socat;
 #       pip install mppsolar; \
 #       

RUN pip install -e "git+https://github.com/oleks85/mpp-solar.git#egg=mppsolar"

VOLUME [ "/etc/mpp-solar" ]

COPY entrypoint.sh entrypoint.sh
RUN ["chmod", "+x", "./entrypoint.sh"]

#CMD ["python3"]
ENTRYPOINT ./entrypoint.sh