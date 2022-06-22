
# Gateway For Microservices - Krakend
###### by TecnoManu

How start Docker system for Gateway based on Krakend Api Services

1. Create the krakend-compiled.json file by default, can be empty or compiled, if you want compile, run this in you terminal:

* ```APP_NAME=name_as_you_want sh check-config.sh```

2. Create a Network Docker

* ```docker network create  microservice-network```

3. Run docker-compose from root directory of this repository

* For Watch: ```docker-compose up -d dev```
Default por is 9595

* For Production: ```docker-compose up -d prod```
Default por is 8080

Now Krakend is running :alien: :tada:

#### Validate config before CI/CD

Use this command for validate config before deploy to production:

```FC_ENABLE=1 FC_SETTINGS="$PWD/config/settings" FC_PARTIALS="$PWD/config/partials" FC_TEMPLATES="$PWD/config/templates" APP_NAME="name_as_you_want" krakend check -t -d -c "$PWD/config/krakend.json"```

<hr/>

## Development

### Recreate krakend config json

If you want recreate the config json file with updates, use this command every you want to reload the routes (only for development environment)
```APP_NAME=name_as_you_want sh check-config.sh ```


### Testing routes

For test the routes (defaults setting in ```./config/settings/auth.json```) can use Postman or some plugin in Visual Studio Code like this:
https://marketplace.visualstudio.com/items?itemName=humao.rest-client

After than, you can rename the file ```request.http.example```to ```request.http```, then use the default routes to test the gateway.

###### _Remember to change default PORT in routes as you were set in the .env file._