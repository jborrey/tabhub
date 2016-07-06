# Institutions (usually connected to a university) are organizations which
# train debaters and host tournaments.
class Institution < ActiveRecord::Base
  has_many :users       # members of this society
  has_many :tournaments # tournaments hosted by this institution

  validates_presence_of :name
  validates_presence_of :president_id # effectively the owner of this model
end
