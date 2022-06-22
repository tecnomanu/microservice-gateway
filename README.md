
# Gateway For Microservices - Krakend
#### by TecnoManu

How start Docker system for Gateway based on Krakend Api Services

1. Create a Network Docker
```docker network create  microservice-network```

2. Run docker-compose from root directory of this repository

For Watch:
```docker-compose up -d dev```
Default por is 9595

For Production:
```docker-compose up -d prod```
Default por is 8080

Now Krakend is running


#### Validate config before CI/CD

Use this command for validate config before deploy to production:

```FC_ENABLE=1 FC_SETTINGS="$PWD/config/settings" FC_PARTIALS="$PWD/config/partials" FC_TEMPLATES="$PWD/config/templates" APP_NAME="companyname" krakend check -t -d -c "$PWD/config/krakend.json"```

### Developments

### Recreate krakend config json

If you want recreate the config json file with updates, use this command every you want to reload the routes (only for development environment)
```APP_NAME=altosregalos sh check-config.sh ```
