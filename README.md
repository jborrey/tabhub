# Tabhub - Debate Tabbing Software

### For local development on Mac

##### Set up your Ruby

```
# install RVM

# install ruby 2.3.0

rvm use 2.3.0 # switch to ruby 2.3.0
````

##### Setting up rails-api
```
# install rails-api
gem install rails-api

# create app
rails-api new tabhub -d=postgresql
# then use config as in config/database.yml
```

##### Setting up Postgres DB
```
# install postgres
brew install postgres
gem install pg

# start the server
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

# stop the server
pg_ctl -D /usr/local/var/postgres stop -s -m fast

# create a db for the app
createdb tabhub

# create a role for the app
psql tabhub

tabhub=# CREATE ROLE app with CREATEDB CREATEROLE LOGIN PASSWORD 'unsw';
# \q to exit psql shell

rake db:create
```
