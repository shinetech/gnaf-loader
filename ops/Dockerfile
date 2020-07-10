FROM mdillon/postgis:11

WORKDIR /app
ENV HOME /app

VOLUME ["./data"]
COPY . /app

ENTRYPOINT ["/app/import.sh"]
CMD ["import"]