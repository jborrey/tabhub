# Tournament model is a representation of a debating tournament.
class Tournament < ActiveRecord::Base
  validates_presence_of :name
end
