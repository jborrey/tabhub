# Tabhub - Debate Tabbing Software

### Resource Creation
```bash
bin/rails generate scaffold User first_name:string last_name:string username:string{24}:uniq email:string:uniq

bin/rails generate scaffold Tournament name:string start_date:datetime end_date:datetime location:string description:text debate_format:string tournament_type:string number_of_rounds:integer owner_id:integer institution_id:integer
```

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

##### DB Tables

For all:
- Created at
- Updated at

User:
- first name
- Last name
- Username
- Email
- Has_many InstitutionMemberships
- Gravatar link
- Auth stuff for Google
- Has_many tournaments (owner)
- Website
- Twitter
- FB
- YouTube

Tournament:
- belongs to institution (host)
- Belongs to user (owner)
- Name
- Start date
- End date
- Location
- Description
- Facebook link
- Twitter handle
- YouTube channel
- Format: (enum)
- Style: Open/IV (enum)
- has many participants
- Has many teams
- Has many institutions
- Has many panels
- Has many rounds
- num rounds
- All the settings

Participants:
- User_id
- Role (debater, adj * 2 , obs, volunteer, admin)
- Tournament_id
- Institution_id

DebateDraw
- has many debate round
- Motion
- Order
- Belongs to tournament

DebateRound
- Belongs_to tournament
- Belongs to draw
- Has one panel
- Has many teams
- Has one room
- Stream link
- Has one ballot
- Ranking (Hash)
- Speaks (Hash)
- Split vs Unanimous
- Has_many feedback

Feedback:
- Direction (chair on wing etc)
- Comments
- Has many answers
- Commenter
- Subject

Answers:
- has one question
- Comment
- Int

Questions: (for feedback)
- wording
- Type
- Has many answers (pull this relation to help give curators understanding of if its a good question to ask or not

Panel:
- has many participants
- Belongs_to round
- Chair (user_is)

Team:
- has many user
- Belongs to tournament
- Belongs to institution

Room:

Motion:
- Tags
- Wording
-

Institution:
- country
- Styles
- President
- Has many Imemberships
- Gravatar link
- Has many rooms
- Has many tournaments (hosting)
- Languages (that they debate in)
- Website
- Twitter
- FB
- YouTube

### Authentication
We will do authentication, for now, by 3rd parties.
We should eventually support Google, Facebook and Twitter.
Do nothing for now - authentication will be last step with JWT!

