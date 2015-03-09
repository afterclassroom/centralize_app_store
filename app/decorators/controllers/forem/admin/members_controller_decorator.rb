Forem::Admin::MembersController.class_eval do
  def add
  	user = Forem.user_class.where(:email => params[:user_email]).first
  	if user
  		if group.members.exists?(user.id)
  			error_message = "This email is already a member of this group."
  		else
  			group.members << user
  		end
  	else
  		error_message = "This email is not exists."
  	end
    redirect_to [:admin, group], :alert => error_message
  end
end