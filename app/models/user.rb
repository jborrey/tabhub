class User < ActiveRecord::Base
  validates_length_of :username, maximum: 24
end
