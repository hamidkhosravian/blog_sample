
# README

It's a simple Blog with simple user authentication.
user can create a article or send a comment.
Guest just can read details .

# configuring

### You can use Docker to run project:

#### make a copy from `docker-compose.sample.yml` and `docker.sample.env` then remove `sample` from your copies. make change on your docker files.
use this command to run docker:

- docker-compose build
- docker-compose up

use can use `docker-compose up -d` to run project in background.

### also you can run project in you system manualy

#### make a copy from `database.sample.yml` and `storage.sample.yml` then remove `sample` from your copies. make change on your files. install require gems with `bundle install`, then run ` rails credentials:edit` to generate you rails secret keys. create and migrate database with `rake db:create` and `rake db:migrate`.

the project is ready: `rails s`.
