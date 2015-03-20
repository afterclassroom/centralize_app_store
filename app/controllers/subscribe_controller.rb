class SubscribeController < ApplicationController

	def create_subscribe
		if params[:txtEmail]
			#UserMailer.delay.subscribe(params[:txtEmail], '[gotoClassroom] Subscribe Email', EMAIL_NOTIFICATION)
			UserMailer.subscribe(params[:txtEmail], '[gotoClassroom] Subscribe Email', EMAIL_NOTIFICATION).deliver
		end
		render :nothing => true
	end
end
