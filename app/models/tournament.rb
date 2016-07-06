# Tournament model is a representation of a debating tournament.
class Tournament < ActiveRecord::Base
  belongs_to :user, foreign_key: :owner_id
  alias owner user

  validates_presence_of :name
end
