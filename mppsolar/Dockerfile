FROM python:slim

RUN set -eux; \
        apt-get update; \
        apt-get install -y build-essential libglib2.0-dev; \
        pip install mppsolar;

VOLUME [ "/etc/mpp-solar" ]

CMD ["python3"]
ENTRYPOINT ["mpp-solar" "--configfile" "/etc/mpp-solar/mpp-solar.conf"]