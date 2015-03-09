class UserProfilesController < ApplicationController
	def update
		@user_profile = current_user.user_profile
		@user_profile.update_attributes(params[:user_profile])
	end
end
