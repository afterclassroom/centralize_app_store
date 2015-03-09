class RegistrationsController < Devise::RegistrationsController
	layout 'developer'
	def new
		super
	end

	def create
		super
	end

	def edit
		super
		@user_profile = current_user.user_profile
		puts "---------------"
		puts @user_profile
		puts "---------------"
	end

	def update
		super
	end

	def update_profile
		@user_profile = current_user.user_profile
		@user_profile.update_attributes(params[:user_profile])
	end
end
