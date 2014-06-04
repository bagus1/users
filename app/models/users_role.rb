class UsersRole < ActiveRecord::Base
  has_many :users
  has_many :roles
  scopify #what good is this?
  scope :by_user_id, ->(user_id) {where(user_id: user_id.to_s)}
  
end
