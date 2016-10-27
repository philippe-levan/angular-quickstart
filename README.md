Angular 2 quick start
=====================

```
# in a bash
docker-compose build
docker-compose up
# in another bash
docker exec -ti quickstart_angular_1 bash

# we are using yarn instead of npm because of the .lock file.
yarn install

# if needed compile ts files manually
# ./node_modules/.bin/typings install

yarn start
```
