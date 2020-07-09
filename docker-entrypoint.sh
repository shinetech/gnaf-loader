#!/bin/bash

#printenv
#
#while ! PGPASSWORD=gnaf psql -h db -U gnaf -l >/dev/null; do
#  echo "** Waiting for PostgreSQL to start up and be ready for queries. **"
#  sleep 5
#done
#
#echo "** Launching loader **"
#python load-gnaf.py --gnaf-tables-path /data/*GNAF_PipeSeparatedValue*/ --admin-bdys-path /data/*AdminBounds_ESRIShapefileorDBFfile*/ --pghost db --pgdb gnaf --pguser gnaf --pgpassword gnaf
#
#echo "** Dumping GNAF **"
#PGPASSWORD=gnaf pg_dump -Fc -h db -U gnaf -n gnaf_202005 -f "/data/gnaf_202005.dmp" --no-owner

while ! psql -l >/dev/null; do
  echo "** Waiting for PostgreSQL to start up and be ready for queries. **"
  sleep 5
done

echo "** Launching loader **"
python load-gnaf.py --gnaf-tables-path /data/*GNAF_PipeSeparatedValue*/ --admin-bdys-path /data/*AdminBounds_ESRIShapefileorDBFfile*/

echo "** Dumping GNAF **"
pg_dump -Fc -n gnaf_202005 -f "/data/gnaf_202005.dmp" --no-owner