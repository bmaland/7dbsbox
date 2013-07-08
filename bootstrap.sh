#!/usr/bin/env bash

apt-get -y update

# Postgresql
apt-get -y install postgresql-9.1 postgresql-contrib-9.1

# Set up postgres user + db with hstore
if ! sudo su postgres -c "psql template1 -c '\dx'" | grep hstore > /dev/null; then
  sudo su postgres -c "psql -d template1 -c 'CREATE EXTENSION hstore;'"
fi

if ! sudo su postgres -c "psql template1 -c '\du'" | grep vagrant > /dev/null;  then
  sudo su postgres -c "createuser vagrant -s"
fi

if ! sudo su postgres -c "psql -l" | grep vagrant > /dev/null; then
  sudo su postgres -c "createdb vagrant"
fi

cp /vagrant/files/pg_hba.conf /etc/postgresql/9.1/main/pg_hba.conf
cp /vagrant/files/postgresql.conf /etc/postgresql/9.1/main/postgresql.conf

service postgresql restart
