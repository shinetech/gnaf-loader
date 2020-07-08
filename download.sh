curl --url "$GNAF_DOWNLOAD_URL" --output ./data/GNAP.zip
curl --url "$ADMIN_BDYS_DOWNLOAD_URL" --output ./data/ADMIN_BDYS.zip

for d in ./data/*.zip
do
  unzip -d ./data "$d"
done
