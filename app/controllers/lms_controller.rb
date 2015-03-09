class LmsController < ApplicationController
  def install
  	respond_to do |format|
  		lms = Lm.new(lm_params)
  		if lms.save
  			msg = { :status => "ok", :message => "Success!", :access_token => lms.access_token }
  		else
  			msg = { :status => "error", :message => "Fail!" }
  		end

	    format.json  { render :json => msg }
	  end
  end

  private

  def lm_params
    params.require(:lm).permit(:name, :domain, :school_address, :school_telephone, :school_email, :admin_email, :admin_name, :principle_name)
  end
end
