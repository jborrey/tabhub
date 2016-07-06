# This file should contain all the record creation needed to seed the
# database with its default values. The data can then be loaded with
# the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

NUM_USERS = 10000
NUM_INSTITUTIONS = 500
NUM_TOURNAMENTS = 50

NUM_USERS.times do |i|
  User.create(
    first_name: "User #{1 + i} FN",
    last_name:  "User #{1 + i} LN",
    username:   "User #{1 + i}",
    email:      "user#{1 + i}@example.com",
  )
end

NUM_INSTITUTIONS.times do |i|
  Institution.create(
    name: "Institution #{i}",
    university: "University #{i}",
    location: "Vault #{i}",
    president_id: (1 + i),
    website: 'www.example#{i}.com',
    founded_at: "#{1897 + i}-01-01"
  )
end

NUM_TOURNAMENTS.times do |i|
  Tournament.create(
    name: "Tournament #{1 + i}",
    start_date: '2009-01-03 14:00:00',
    end_date: '2009-01-06 14:00:00',
    location: 'Some place far far away.',
    description: 'Tournamnet description .....',
    debate_format: 'BP',
    tournament_type: 'Open',
    number_of_rounds: (4 + Random.rand(5)),
    owner_id: (1 + i),
    institution_id: (1 + i),
  )
end
