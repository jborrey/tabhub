# This file should contain all the record creation needed to seed the
# database with its default values. The data can then be loaded with
# the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

NUM_USERS = 100

NUM_USERS.times do |i|
  User.create(
    first_name: "User #{i} FN",
    last_name:  "User #{i} LN",
    username:   "User #{i}",
    email:      "user#{i}@example.com"
  )
end
