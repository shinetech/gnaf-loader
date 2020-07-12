#!/bin/bash

psql --version

while ! psql -l > /dev/null; do
  echo "** Waiting for connection with RDS to start up and be ready for queries. **"
  sleep 10
done

echo "** Database connection is ready to use **"
psql -l

REQUIRE_EXTENSIONS_COUNT=3
EXTENSIONS=$(psql -d "$PGDATABASE" -p "$PGPORT" -U "$PGUSER" -c "\dx")
echo "$EXTENSIONS";
CHECK_EXTENSION=$(echo "$EXTENSIONS" | grep -E 'postgis|fuzzystrmatch|postgis_topology' -c)

echo "Found $CHECK_EXTENSION/$REQUIRE_EXTENSIONS_COUNT required extension(s) installed!"

if [ "$CHECK_EXTENSION" -lt $REQUIRE_EXTENSIONS_COUNT ]; then
  echo "ERROR: Extensions count should be at least $REQUIRE_EXTENSIONS_COUNT, but found only $CHECK_EXTENSION"
  echo "ERROR: Required extensions were not installed properly or missing! Now exitting..."
  exit 1;
fi

echo "All required extensions are found, now processing data files..."

if [ ! "$GNAF_DUMP_URL" = "" ]; then
  echo "** Now downloading GNAF dump **"
  curl --url "$GNAF_DUMP_URL" --output ./data/GNAP.dmp
  echo "** Now importing GNAF dump into RDS **"
  pg_restore -Fc -d "$PGDATABASE" -p "$PGPORT" -U "$PGUSER" ./data/GNAP.dmp
fi

if [ ! "$ADMIN_BDYS_DUMP_URL" = "" ]; then
  echo "** Now downloading ADMIN_BDYS dump **"
  curl --url "$ADMIN_BDYS_DUMP_URL" --output ./data/ADMIN_BDYS.dmp
  echo "** Now importing ADMIN_BDYS dump into RDS **"
  pg_restore -Fc -d "$PGDATABASE" -p "$PGPORT" -U "$PGUSER" ./data/ADMIN_BDYS.dmp
fi
