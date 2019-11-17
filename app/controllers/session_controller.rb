class SessionController < ApplicationController
  skip_before_action :authorized, only: [:new_session, :create, :destroy]
  def new_session
    user = User.new
    respond_to do |format|
      format.html { render :login, locals: { user: user } }
    end
  end

  def create
    respond_to do |format|
      format.html {
        if User.find_by(username: params[:username], password: params[:password])
          user = User.find_by(username: params[:username])
          flash[:success] = "Login"
          session[:user_id] = user.id
          redirect_to profile_path
        else
          flash.now[:error] = "Login information is incorrect"
          render :login, locals: { user: user }
        end
      }
    end
  end

  def destroy   
    session[:user_id] = nil 
    flash[:success] = "Logout"  
    redirect_to login_path  
  end 

  def profile
    respond_to do |format|
      format.html { render :profile }
    end
  end

  def upgrade
    request = Request.new
    respond_to do |format|
      format.html { render :upgrade, locals: { request: request } }
    end
  end

  def new_request
    request = Request.new(params.require(:request).permit(:acc_type, :resaon))
    respond_to do |format|
      format.html {
        if request.save
          flash[:success] = "Request saved successfully"
          redirect_to profile_path
        else
          flash.now[:error] = "Request could not be saved"
          render :upgrade, locals: { request: request }
        end
      }
    end
  end

  def promote
    requests = Request.all
    respond_to do |format|
      format.html { render :promote, locals: { requests: requests } }
    end
  end

end
