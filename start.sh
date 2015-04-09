#!/bin/bash


RAILS_ENV=production rake db:migrate
RAILS_ENV=production rake assets:clean
RAILS_ENV=production rake assets:precompile
rails server -e production