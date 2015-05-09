class CustomFailure < Devise::FailureApp
  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      if params[:user]
      	flash[:error] = "Email or password is incorrect."
      end
      redirect_to new_user_session_path
    end
  end
end