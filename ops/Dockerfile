FROM python:3.6-jessie

RUN echo deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main > /etc/apt/sources.list.d/jessie-pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update && apt-get install -y --no-install-recommends \
  postgresql-client-11 postgis && \
  apt-get autoremove -y --purge && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app
ENV HOME /app

VOLUME ["./data"]
COPY . /app

ENTRYPOINT ["/app/import.sh"]
CMD ["import"]