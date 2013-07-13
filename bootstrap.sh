#!/usr/bin/env bash

apt-get -y update

# Postgresql
apt-get -y install postgresql-9.1 postgresql-contrib-9.1

# Set up postgres user + db with hstore
if ! su postgres -c "psql template1 -c '\dx'" | grep hstore > /dev/null; then
  su postgres -c "psql -d template1 -c 'CREATE EXTENSION hstore;'"
fi

if ! su postgres -c "psql template1 -c '\du'" | grep vagrant > /dev/null;  then
  su postgres -c "createuser vagrant -s"
fi

if ! su postgres -c "psql -l" | grep vagrant > /dev/null; then
  su postgres -c "createdb vagrant"
fi

cp /vagrant/files/pg_hba.conf /etc/postgresql/9.1/main/pg_hba.conf
cp /vagrant/files/postgresql.conf /etc/postgresql/9.1/main/postgresql.conf

service postgresql restart

# Couchdb
apt-get -y install couchdb
cp /vagrant/files/local.ini /etc/couchdb/local.ini
service couchdb restart

# Mongodb
apt-get -y install mongodb-server
cp /vagrant/files/mongodb.conf /etc/mongodb.conf
service mongodb restart

# Neo4j
apt-get -y install openjdk-7-jre-headless

if [ ! -e /home/vagrant/neo4j-community-1.9.1-unix.tar.gz ]; then
  su vagrant -c "cd /home/vagrant && wget http://dist.neo4j.org/neo4j-community-1.9.1-unix.tar.gz && tar -zxvf neo4j-community-1.9.1-unix.tar.gz"
  su vagrant -c "sed -i.bak 's/#org.neo4j.server.webserver.address=0.0.0.0/org.neo4j.server.webserver.address=0.0.0.0/g' /home/vagrant/neo4j-community-1.9.1/conf/neo4j-server.properties"
fi

su vagrant -c "/home/vagrant/neo4j-community-1.9.1/bin/neo4j start"

# Redis
apt-get -y install redis-server
cp /vagrant/files/redis.conf /etc/redis/redis.conf
service redis-server restart

# Riak

sudo apt-get install libssl0.9.8

if [ ! -e /home/vagrant/riak_1.4.0-1_amd64.deb ]; then
  su vagrant -c "cd /home/vagrant && wget http://s3.amazonaws.com/downloads.basho.com/riak/1.4/1.4.0/ubuntu/precise/riak_1.4.0-1_amd64.deb"
  dpkg -i /home/vagrant/riak_1.4.0-1_amd64.deb
  cp /vagrant/files/app.config /etc/riak/app.config
  service riak start
fi

# HBase

if [ ! -e /etc/apt/sources.list.d/cloudera.list ]; then
  cp /vagrant/files/hosts /etc/hosts
  apt-get -y install curl
  curl -s http://archive.cloudera.com/cdh4/ubuntu/lucid/amd64/cdh/archive.key | apt-key add -
  cp /vagrant/files/cloudera.list /etc/apt/sources.list.d/cloudera.list
  apt-get -y install hbase-rest
fi

JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 /usr/lib/hbase/bin/hbase-daemon.sh start master
service hbase-rest start
