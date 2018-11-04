#!/usr/bin/env bash

# Prefix `bundle` with `exec` so unicorn shuts down gracefully on SIGTERM (i.e. `docker stop`)
exec bundle exec unicorn -c /var/www/blog_sample/config/containers/app/unicorn.rb -E $RAILS_ENV;
