# Cloudformation for CodePipeline

To deploy CI pipeline to dev account, using AWS CLI:

```
aws cloudformation deploy --template-file ops/template.yml --stack-name nmi-geolocation-gnaf-loader --parameter-overrides VpcSecurityGroupIds=sg-64ef4f01,sg-6b0d9c0c,sg-63e34306 VpcSubnetIds=subnet-1932e37c,subnet-e432e381,subnet-e29b6595,subnet-e79b6590,subnet-061cbbc4117632f5b VpcId=vpc-7afd061f
```