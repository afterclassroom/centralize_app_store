class LmsController < ApplicationController
  before_action :authenticate_user!
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
    @lm = Lm.new
  end

  def create
    @lm = Lm.new(lm_params)
    @lm.user = current_user
    if @lm.save
      flash[:notice] = "Create success!"
      redirect_to @lm
    else
      render new_lm_path
    end
  end

  def show
    @lm = current_user.lms.where(:id => params[:id]).first
  end

  def edit
    @lm = current_user.lms.where(:id => params[:id]).first
  end

  def update
    @lm = Lm.find(params[:id])
    @lm.user = current_user
    if @lm.update(lm_params)
      flash[:notice] = "Update success!"
      redirect_to @lm
    else
      render edit_lm_path(@lm)
    end
  end

  def destroy
    @lm = Lm.find(params[:id])
    @lm.destroy
    flash[:notice] = "Delete successfull"
    redirect_to lms_path
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
    params.require(:lm).permit(:name, :domain, :school_name, :school_address, :school_telephone, :school_email, :admin_email, :admin_name, :principle_name, :brand)
  end
end
