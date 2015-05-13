class UserProfilesController < ApplicationController
	layout 'developer'

	def edit
		@user_profile = current_user.user_profile
	end

	def update
		user_profile = current_user.user_profile
		if current_user.update_attributes(user_params) && user_profile.update_attributes(user_profile_params)
			flash[:edit_profile_success] = "Change profile successfull"
			redirect_to edit_user_user_profile_path(current_user, current_user.user_profile.id)
		else
			flash[:edit_profile_error] = "Change profile failed"
			redirect_to edit_user_user_profile_path(current_user, current_user.user_profile.id)
		end
	end

	private

  	def user_profile_params
    	params.require(:user_profile).permit(:name, :address)
  	end

  	def user_params
  		params.require(:user).permit(:email, :avatar)
  	end
end
