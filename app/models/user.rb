# Model for User table.
# Users are tournament owners, debaters, judges, etc.
class User < ActiveRecord::Base
  # all institutions that this debater is a memeber of (past and present)
  has_many :institutions
  has_many :tournaments, foreign_key: :owner_id

  validates_length_of :username, maximum: 24
  # will probably want this later
  # validates_format_of :email,:with => Devise::email_regexp
end
