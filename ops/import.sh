#!/bin/bash

printenv

psql --version

while ! psql -l; do
  echo "** Waiting for connection with RDS to start up and be ready for queries. **"
  sleep 10
done

if [ ! "$GNAF_DUMP_URL" = "" ]; then
  curl --url "$GNAF_DUMP_URL" --output ./data/GNAP.dump
  echo "** Now importing GNAF dump into RDS **"
  # pg_restore -Fc /data/GNAP.dmp
fi

if [ ! "$ADMIN_BDYS_DUMP_URL" = "" ]; then
  curl --url "$ADMIN_BDYS_DUMP_URL" --output ./data/ADMIN_BDYS.dump
  echo "** Now importing ADMIN_BDYS dump into RDS **"
  # pg_restore -Fc /data/ADMIN_BDYS.dmp
fi
