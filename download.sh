curl --url "https://data.gov.au/data/dataset/19432f89-dc3a-4ef3-b943-5326ef1dbecc/resource/4b084096-65e4-4c8e-abbe-5e54ff85f42f/download/may20_gnaf_pipeseparatedvalue.zip" --output ./data/GNAP.zip
curl --url "https://data.gov.au/data/dataset/bdcf5b09-89bc-47ec-9281-6b8e9ee147aa/resource/53c24b8e-4f55-4eed-a189-2fc0dcca6381/download/may20_adminbounds_esrishapefileordbffile.zip" --ouput ./data/ADMIN_BDYS.zip

for d in ./data/*.zip
do
  unzip -d ./data "$d"
done
