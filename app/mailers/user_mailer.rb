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
				str = str + 'First name : ' + array[:first_name] + '<br>'
				str = str + 'Last name : ' + array[:last_name] + '<br>'
				str = str + 'Company/Orgarnization : ' + array[:company] + '<br>'
				str = str + 'Email address : ' + array[:email] + '<br>'
				str = str + 'Message :<br>'
				str = str + '<pre style="font-family: arial;">' + array[:message] + '</pre>'

				render :text => str
			end
		end
	end
end
