#!/bin/sh

bundle install
yarn add jquery@3.5.1 bootstrap@3.4.1


# heroku pg:reset DATABASE
# heroku run:detached rails db:migrate
# heroku run:detached rails db:seed
# figaro heroku:set -e production