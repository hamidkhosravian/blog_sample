#!/usr/bin/env bash

# Prefix `bundle` with `exec` so unicorn shuts down gracefully on SIGTERM (i.e. `docker stop`)
RACK_ENV=$RAILS_ENV bundle exec puma -p 8080
