class UsersSerializer
  include FastJsonapi::ObjectSerializer
  attributes :email, :password, :api_key
end
