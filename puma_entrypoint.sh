#!/bin/sh

# Instalamos las dependencias iniciales
bundle install

# Creamos la base de datos ejecutamos las migraciones y los seeds.
RAILS_ENV=development bundle exec rails db:drop db:create db:migrate db:seed

bundle exec puma --environment development