class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :admin, :name, :created_at
end
