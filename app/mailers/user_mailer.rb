class UserMailer < ActionMailer::Base
	default from: "support@gotoclassroom.com"
	layout "mailer"

	def subscribe(from_email, subject, to_email)
		mail(:to => to_email, :subject => subject) do |format|
			format.text do
				render :text => 'Subscribe Email:	' + from_email
			end
		end
	end

	def contact(array, subject, to_email)
		mail(:to => to_email, content_type: "text/html", :subject => subject) do |format|
			format.text do
				str = ''
				str = str + 'First name : ' + array[:first_name].to_s + '<br>'
				str = str + 'Last name : ' + array[:last_name].to_s + '<br>'
				str = str + 'Company/Orgarnization : ' + array[:company].to_s + '<br>'
				str = str + 'Email address : ' + array[:email].to_s + '<br>'
				str = str + 'Message :<br>'
				str = str + '<pre style="font-family: arial;">' + array[:message].to_s + '</pre>'

				render :text => str
			end
		end
	end

	def get_free_lms(array, subject, to_email)
		mail(:to => to_email, content_type: "text/html", :subject => subject) do |format|
			format.text do
				str = ''
				str = str + 'School Name : ' + array[:school_name].to_s + '<br>'
				str = str + 'School Address : ' + array[:school_address].to_s + '<br>'
				str = str + 'School Tel : ' + array[:school_tel].to_s + '<br>'
				str = str + 'School Email : ' + array[:school_email].to_s + '<br>'
				str = str + 'School Principle / President Name : ' + array[:school_principle].to_s + '<br>'
				str = str + 'Role : ' + array[:your_role].to_s + '<br>'
				str = str + 'Message :<br>'
				str = str + '<pre style="font-family: arial;">' + array[:message_text].to_s + '</pre>'

				render :text => str
			end
		end
	end
end
