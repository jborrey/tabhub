# Serializes the user API output.
class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email
end
