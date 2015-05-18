class LmsController < ApplicationController
  before_action :authenticate_user!, :except => :check
  layout 'developer'
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

  def index
    @lms = current_user.lms.paginate(:page => params[:page]).order('id DESC')
  end

  def new
    @body_class = 'page-lmsform'
    @lm = Lm.new
  end

  def create
    @lm = Lm.new(lm_params)
    @lm.user = current_user
    if @lm.save
      flash[:lms_notice] = "Create success! The access token was created below. You can use it to install your lms."
      redirect_to @lm
    else
      flash[:lms_error] = "Create error!"
      render new_lm_path
    end
  end

  def show
    @lm = current_user.lms.where(:id => params[:id]).first
  end

  def edit
    @body_class = 'page-lmsform'
    @lm = current_user.lms.where(:id => params[:id]).first
  end

  def update
    @lm = Lm.find(params[:id])
    @lm.user = current_user
    if @lm.update(lm_params)
      flash[:lms_notice] = "Update success!"
      redirect_to @lm
    else
      flash[:lms_error] = "Update error!"
      render edit_lm_path(@lm)
    end
  end

  def destroy
    @lm = Lm.find(params[:id])
    @lm.destroy
    flash[:notice] = "Delete successfull"
    redirect_to lms_path
  end

  def check
    access_token = params[:access_key]
    lm = Lm.find_by_access_token(access_token)
    if lm
      render :json => {
        :msg => "Yes"
      }
    else
      render :json => {
        :msg => "No"
      }
    end
  end

  private

  def lm_params
    params.require(:lm).permit(:name, :domain, :school_name, :school_address, :school_telephone, :school_email, :admin_email, :admin_name, :principle_name, :brand)
  end
end
