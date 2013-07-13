# 7dbsbox

This is a [Vagrant](http://www.vagrantup.com) box for experimenting with the
databases described in the Pragmatic Studios book
[Seven Databases in Seven Weeks](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks).

The default ports for the various databases will be forwarded to your local
machine (the VM host), so that you transparently can connect to `localhost`.

**Instructions:**

* [Download and install Vagrant](http://downloads.vagrantup.com) (only tested with 1.2.x)
* Clone this repo and run `vagrant up` from the root dir.

See specific instructions for the various databases below.

## PostgreSQL

Version: 9.3, with the hstore extension enabled.

Connect to localhost on port 5432 (which is the default port) using `vagrant` as
the username. Trust authentication is enabled, so no password is necessary.

Connect using the command line: `psql --host localhost --user vagrant`

## CouchDB

Version: 1.0.1.

The web admin interface (futon) is available at: http://localhost:5984/_utils/

## MongoDB

Version: 2.0.4.

Connect using the command line: `mongo`

The admin web console is also available on the default port:
`http://localhost:28017`

## Riak

Version: 1.4.0

The admin web interface is available at: http://localhost:8098/admin/

## HBase

Version: 0.94.6

REST API interface: http://localhost:8080/

Master status: http://localhost:60010/master-status

Region server status: http://localhost:60030/rs-status

## Redis

Version: 2.2.12.

Redis runs on its default port (6379) and allows connections from any host
without any authentication.

Connect using the command line: `redis-cli`

## Neo4j

Version: 1.9.1.

The web admin interface is available at: http://localhost:7474/webadmin/
