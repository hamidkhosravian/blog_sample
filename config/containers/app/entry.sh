#!/bin/bash
set -e

# wait for postgres to load completely
sh /var/www/blog_sample/config/containers/app/wait-for-postgres.sh

rake db:create
rake db:migrate
rake db:seed

if [[ $@ == 'app' ]]; then
  exec /var/www/blog_sample/config/containers/app/server.sh
fi

exec "$@"
