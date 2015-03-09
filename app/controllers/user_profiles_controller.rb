class UserProfilesController < ApplicationController
	layout 'developer'

	def edit
		@user_profile = current_user.user_profile
	end

	def update
		@user_profile = current_user.user_profile
		if @user_profile.update_attributes(user_profile_params) && current_user.update_attributes(user_email_params)
			redirect_to edit_user_user_profile_path(current_user, current_user.user_profile.id)
		else
			
		end
	end

	private

  	def user_profile_params
    	params.require(:user_profile).permit(:name, :address)
  	end

  	def user_email_params
  		params.require(:user).permit(:email, :avatar)
  	end
end
