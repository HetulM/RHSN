class RegistrationsController < Devise::RegistrationsController

	# The controller for the registrations, this was used to state which parameters are required for signing up 
	# and updating an account. 

	private
	def sign_up_params
	  params.require(:user).permit(:avatar, :name, :username, :email, :password, :password_confirmation)
	 end

	def account_update_params
	  params.require(:user).permit(:avatar, :name, :username, :email, :password, :password_confirmation, :current_password)
	end
end
