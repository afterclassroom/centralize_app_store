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

  def lms_create
    name = params[:name]
    domain = params[:domain]
    school_address = params[:school_address]
    school_telephone = params[:school_telephone]
    school_email = params[:school_email]
    admin_email = params[:admin_email]
    admin_name = params[:admin_name]
    principle_name = params[:principle_name]
    lms = Lm.create(:name => name, :domain => domain, :school_address => school_address, :school_telephone => school_telephone, :school_email => school_email, :admin_email => admin_email, :admin_name => admin_name, :principle_name => principle_name)
    if lms.save
      render :json => {
        :meta => {
          :success => "Success."
        },
        :lms => lms
      }
    else
      render :json => {
        :meta => {
          :error => "Create new lms error."
        }
      }
    end
  end

  def lms_update
    lm_id = params[:id]
    lms = Lm.find(lm_id)
    name = params[:name]
    domain = params[:domain]
    school_address = params[:school_address]
    school_telephone = params[:school_telephone]
    school_email = params[:school_email]
    admin_email = params[:admin_email]
    admin_name = params[:admin_name]
    principle_name = params[:principle_name]
    if lms
      if lms.update_attributes(:name => name, :domain => domain, :school_address => school_address, :school_telephone => school_telephone, :school_email => school_email, :admin_email => admin_email, :admin_name => admin_name, :principle_name => principle_name)
        render :json => {
          :meta => {
            :success => "Success."
            },
            :lms => lms
          }
      else
        render :json => {
          :meta => {
            :error => "Update lms failed."
          }
        }
      end
    else
      render :json => {
        :meta => {
          :error => "Could not find lms."
        }
      }
    end
  end

  def get_lms_install
    access_token = params[:access_token]
    lms = Lm.find_by_access_token(access_token)
    if lms
      render :json => {
        :meta => {
          :success => "Success."
        },
        :lms => lms
      }
    else
      render :json => {
        :meta => {
          :error => "Could not find lms."
        }
      }
    end
  end

  private

  def lm_params
    params.require(:lm).permit(:name, :domain, :school_address, :school_telephone, :school_email, :admin_email, :admin_name, :principle_name)
  end
end
