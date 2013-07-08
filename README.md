# 7dbsbox

This is a [Vagrant](http://www.vagrantup.com) box for experimenting with the
databases described in the Pragmatic Studios book
[Seven Databases in Seven Weeks](http://pragprog.com/book/rwdata/seven-databases-in-seven-weeks).

Instructions:

* [Download and install Vagrant](http://downloads.vagrantup.com) (only tested with 1.2.x)
* Clone this repo and run `vagrant up` from the root dir.

See specific instructions for the various databases below.

## PostgreSQL

Connect to localhost on port 5432 using `vagrant` as the username. Trust
authentication is enabled, so no password is necessary.

Using the command line: `psql --host localhost --user vagrant`
