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

			#UserMailer.delay.contact(content, '[gotoClassroom] Contact Email', EMAIL_NOTIFICATION)
			UserMailer.contact(content, '[gotoClassroom] Contact Email', EMAIL_NOTIFICATION).deliver
		end
		render :nothing => true
	end

	def create_source_code
		if params[:school_email] && params[:school_name]
			content = {
				school_name: params[:school_name],
				school_address: params[:school_address],
				school_tel: params[:school_tel],
				school_email: params[:school_email],
				school_principle: params[:school_principle],
				your_role: params[:your_role],
				message_text: params[:message_text]
			}

			#UserMailer.delay.get_free_lms(content, '[gotoClassroom] Get the source code - Get Free LMS', EMAIL_NOTIFICATION)
			UserMailer.get_free_lms(content, '[gotoClassroom] Get the source code - Get Free LMS', EMAIL_NOTIFICATION).deliver

			UserMailer.get_free_lms_to_order(params[:school_principle], params[:school_email]).deliver
		end
		render :nothing => true
	end
end
