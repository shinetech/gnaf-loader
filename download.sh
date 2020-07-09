#curl --url "$GNAF_DOWNLOAD_URL" --output ./data/GNAP.zip
#curl --url "$ADMIN_BDYS_DOWNLOAD_URL" --output ./data/ADMIN_BDYS.zip
curl --url "http://minus34.com/opendata/psma-202005/gnaf-202005.dmp" --output ./data/gnaf-202005.dmp

#for d in ./data/*.zip
#do
#  unzip -d ./data "$d"
#done
