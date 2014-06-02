class UsersRole < ActiveRecord::Base
  has_many :users
  has_many :roles
  scopify

end
