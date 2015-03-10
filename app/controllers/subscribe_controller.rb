class SubscribeController < ApplicationController

	def create_subscribe
		if params[:txtEmail]
			UserMailer.delay.subscribe(params[:txtEmail], '[gotoClassroom] Subscribe Email', EMAIL_NOTIFICATION)
		end
		render :nothing => true
	end
end
