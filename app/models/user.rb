class User < ActiveRecord::Base
	rolify
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	accepts_nested_attributes_for :roles
	#has_many :roles, through: :users_roles
	has_and_belongs_to_many :roles, :join_table => :users_roles
 	belongs_to :resource, :polymorphic => true
 
	def xhas_role?(role_sym) 
		#set_roles_for_user
		#challenge: write this all in one line.
		#logger.info "booooooooooop " + role_sym.inspect
		#abort(self[:id].to_s)
		ur = Role.by_user_id(self[:id].to_s)
		ur.each do |user_role|
 			logger.info user_role.inspect + " == " + role_sym.downcase.inspect
	 		if user_role.to_sym == role_sym.downcase 
	 			return true
	 		end
 		end
 		return false
 	end
end
