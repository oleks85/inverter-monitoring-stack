FROM python:slim

RUN pip install mppsolar

VOLUME [ "/etc/mpp-solar" ]

CMD ["python3"]
ENTRYPOINT ["mpp-solar" "--configfile" "/etc/mpp-solar/mpp-solar.conf"]