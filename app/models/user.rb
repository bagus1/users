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
 


	def has_role?(role_sym)
		logger.info "booooooooooop " + role_sym.inspect
 		Role.all.each do  |role| 
 			logger.info role.inspect
 			logger.info role.name.underscore.to_sym
 			logger.info role_sym.downcase
 			logger.info role.name.underscore.to_sym == role_sym.downcase 
 			return role.name.underscore.to_sym == role_sym.downcase
 		end
 	end
end
