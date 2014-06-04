class Role < ActiveRecord::Base
  	has_and_belongs_to_many :users, :join_table => :users_roles
 	belongs_to :resource, :polymorphic => true
  
  	scopify

    def self.by_user_id(user_id) #returns a hash of strings of the role names.
	  	user_roles = UsersRole.by_user_id(user_id)
    	roles = []
	  	user_roles.each { | user_role | roles << Role.find(user_role[:role_id]).name }
	  	#abort(roles.inspect)
	  	
    	return roles
	end
end
