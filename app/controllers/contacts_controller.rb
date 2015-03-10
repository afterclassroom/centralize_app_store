class ContactsController < ApplicationController

	def create_contact
		if params[:txtEmailAddress] && params[:txtDesc]
			content = {
				first_name: params[:txtFirstName],
				last_name: params[:txtLastName],
				company: params[:txtCompany],
				email: params[:txtEmailAddress],
				message: params[:txtDesc]
			}

			UserMailer.delay.contact(content, '[gotoClassroom] Contact Email', EMAIL_NOTIFICATION)
		end
		render :nothing => true
	end
end
