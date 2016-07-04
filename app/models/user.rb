# Model for User table.
# Users are tournament owners, debaters, judges, etc.
class User < ActiveRecord::Base
  validates_length_of :username, maximum: 24
  # will probably want this later
  # validates_format_of :email,:with => Devise::email_regexp
end
