# TEST FOR PHP API AND FRONTEND WITH REACT

This proyect shows how to connect a frontend with an api.

## requirements

This project needs to you have installed docker and docker-compose.

Also the code requirements are in mode git submodule, but if you search for the links to the other projects

- [php-profile-rest-api](https://github.com/siht/php-profile-rest-api) (<=0.0.8)
- [react_frontend](https://github.com/siht/react_frontend.git) (<=0.0.2)

## how to run

If only want to watch how this project works run in your terminal

```sh
git clone --recurse-submodules https://github.com/siht/docker_php_rest_with_front.git
```

then create two files

- ".env_api" with CONNECTION_STRING, IMGUR_CLIENT_ID, IMGUR_URL variables setted
- ".env_front" with PORT variable setted

get more information about environment variables:

- [php-profile-rest-api](https://github.com/siht/php-profile-rest-api) (<=0.0.8)
- [react_frontend](https://github.com/siht/react_frontend.git) (<=0.0.2)

```sh
docker-compose up

## wait until api already up (only if database is not initialized)
docker-compose exec api vendor/bin/doctrine orm:schema-tool:create
```

### development mode

#### build images

If you want to modify some content because you want to improve this development run

```sh
git clone --recurse-submodules https://github.com/siht/docker_php_rest_with_front.git
```

then create two files

- ".env_api" with CONNECTION_STRING, IMGUR_CLIENT_ID, IMGUR_URL variables setted
- ".env_front" with PORT variable setted

get more information about environment variables:

- [php-profile-rest-api](https://github.com/siht/php-profile-rest-api) (<=0.0.8)
- [react_frontend](https://github.com/siht/react_frontend.git) (<=0.0.2)

```sh
docker-compose build
```

to generate the images to install api and frontend dependencies.

#### install dependencies for development process

With the docker images generated run in the root of this project

```sh
# linux users
docker run -ti --rm -v "$PWD/src/php-profile-rest-api:/app" -w "/app" --user "$(id -u):$(id -g)" react_with_php_api_api composer install
docker run -ti --rm -v "$PWD/src/react_frontend:/app" -w "/app" --user "$(id -u):$(id -g)" node:12.16.3-alpine npm i
```

#### run development mode

Once you build images and install dependencies only left run.

```sh
docker-compose -f docker-compose.yml -f docker-compose.dev.yml up

## wait until api already up (only if database is not initialized)
docker-compose exec api vendor/bin/doctrine orm:schema-tool:create
```
