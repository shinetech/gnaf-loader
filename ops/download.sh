#!/bin/bash

if [ ! "$GNAF_DUMP_URL" = "" ]; then
  curl --url "$GNAF_DUMP_URL" --output ./data/GNAP.dump
fi

if [ ! "$ADMIN_BDYS_DUMP_URL" = "" ]; then
  curl --url "$ADMIN_BDYS_DUMP_URL" --output ./data/ADMIN_BDYS.dump
fi
