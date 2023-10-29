#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 rails db:drop RAILS_ENV=production
bundle exec rake db:create
bundle exec rake db:migrate
