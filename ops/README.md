# Cloudformation for CodeBuild

To deploy stack, using AWS CLI:

```
aws cloudformation deploy --template-file ops/template.yml --stack-name nmi-geolocation-gnaf-loader --parameter-overrides VpcSecurityGroupIds=sg-64ef4f01,sg-6b0d9c0c,sg-63e34306 VpcSubnetIds=subnet-1932e37c,subnet-e432e381,subnet-e29b6595,subnet-e79b6590,subnet-061cbbc4117632f5b VpcId=vpc-7afd061f
```

## Importing dumps

By running the code to import the dump files into database
There will be environment variables need to be overrided

`GNAF_DUMP_URL` `ADMIN_BDYS_DUMP_URL`

These are URL to download the gnaf dump into codebuild.

Leave it blank if we dont want to import this dump. URL can be found in the `gnaf-loader` git repo at `Option #3`.

Otherwise, we also can get temporary download URLs from backup dumps on our S3 bucket - `energetiq-gnaf-dumps`.

The rest is the connection information with our RDS
```
RDS_ENDPOINT
RDS_ENDPOINT_PORT
RDS_DB_NAME
RDS_DB_USER
RDS_DB_PWD
```
Those above can be just text or from our secret manage. For example with `CI` RDS:
```
/rds/shine-ci-nmi-geolocation-master-user:host
/rds/shine-ci-nmi-geolocation-master-user:port
/rds/shine-ci-nmi-geolocation-master-user:dbname
/rds/shine-ci-nmi-geolocation-master-user:username
/rds/shine-ci-nmi-geolocation-master-user:password
```