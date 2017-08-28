# dimelo-twitter --> Web

   ### Install Docker

   * for osX el-capitan(10.11.6): [Download](https://www.docker.com/products/docker#/mac) and install it.

   ### clone source code with following structure

   ##### Sample working structure

    .
    ├── dimelo-twitter

    └── shared

   ### Update Dockerfile, docker-compose.yml

   For Development environment:

   It is strongly recommended to update docker-compose.yml as per preference.
   e.g. database-password (we've used `Welcome@123` as default),
   host names (we've used `web`, `db`  as default),
   environment variables.

   Must update Dockerfile if there is change in dependencies (system,stack), any system library update.

   ### Configure YAML(s)
   For Development environment:

   It is strongly recommended to update YAML files as per
   favourite/preference settings.

   ##### Sample working configurations for web

   * config/database.yml


        development: &default
          adapter: mysql2
          encoding: utf8mb4
          collation: utf8mb4_unicode_ci
          reconnect: true
          database: dimelo_twitter_development
          pool: 15
          reaping_frequency: 25
          username: root
          password: Welcome@123
          host: db
          port: 3306








