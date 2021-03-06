class SessionController < ApplicationController
  skip_before_action :authorized, only: [:new_session, :create, :destroy,]
  def new_session
    user = User.new
    respond_to do |format|
      format.html { render :login, locals: { user: user } }
    end
    
  end

  def create
    user = User.find_by(username: params[:username])
    respond_to do |format|
      format.html {
        if user && user.authenticate(params[:password])
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
  
  def delete  
    user = User.find(current_user.id)
    user.destroy   
    session[:user_id] = nil 
    flash[:success] = "Account was Deleted"  
    redirect_to login_path  
  end
  
  def delete_comic   
    flash[:success] = "Comic was Deleted"  
    redirect_to profile_path  
  end

  def profile
    comics = Comic.where(user_id: current_user.id).all
    comics = comics.order('created_at DESC')
    respond_to do |format|
      format.html { render :profile, locals: { comics: comics } }
    end
  end

  def setting
    respond_to do |format|
      format.html { render :setting }
    end
  end

  def upgrade
    request = Request.new
    respond_to do |format|
      format.html { render :upgrade, locals: { request: request } }
    end
  end

  def new_request
    request = Request.new(params.require(:request).permit(:acc_type, :reason))
    request.user_id = current_user.id
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
    requests = requests.order('created_at DESC')
    respond_to do |format|
      format.html { render :promote, locals: { requests: requests } }
    end
  end

  def promote_user
    response = params[:answer]
    requests = Request.all
    request = Request.find(params[:request_id])
    respond_to do |format|
      format.html {
        if response == 'accept'
          user = User.find(params[:id])
          user.update(group: params[:acc_type])
          request.destroy
          requests = Request.all
          render :promote, locals: { requests: requests }
        elsif response == 'decline'
          request.destroy
          requests = Request.all 
          render :promote, locals: { requests: requests }
        else 
          flash.now[:error] = "Have to Accept or Decline"
          render :promote, locals: { requests: requests }
        end 
      }
    end
  end

  def change_email
    user = User.find(current_user.id)
    respond_to do |format|
      format.html {
        if user.email == params[:current_email]
          if user.update(email: params[:new_email])
            flash[:success] = "Email saved successfully"
            redirect_to profile_path
          else
            flash[:error] = "Email could not be saved"
            redirect_to setting_path
          end    
        else
          flash[:error] = "Invalid Current Email"
          redirect_to setting_path
        end
      }
    end
  end

  def change_bio
    user = User.find(current_user.id)
    user.bio = params[:bio]
    respond_to do |format|
      format.html {
        if params[:bio].present? && user.save 
          flash[:success] = "Bio saved successfully"
          redirect_to profile_path
        else
          flash[:error] = "Bio could not be saved"
          redirect_to setting_path
        end    
      }
    end
  end

  def change_password
    user = User.find(current_user.id)
    respond_to do |format|
      format.html {
        if user && user.authenticate(params[:password])
          if user.update(password: params[:new_password], password_confirmation: params[:password_confirmation])
            flash[:success] = "Password saved successfully"
            redirect_to profile_path
          else
            flash[:error] = "Password could not be saved"
            redirect_to setting_path
          end    
        else
          flash[:error] = "Invalid Password"
          redirect_to setting_path
        end
      }
    end
  end

  def create_notification
    followers = Follower.where(following_id: current_user.id).all
    followers.each do |follower|
      Notification.create(follower_id: follower.id, message: params[:message], read: false, user_id: follower.user_id)
    end
    redirect_to profile_path
  end

  def follow
    current = Follower.new(user_id: current_user.id, following_id: params[:user])
    if current.save
      flash[:success] = "Followed successfully"
    else
      flash[:error] = "Follow request couldn't be made"
    end
    redirect_back(fallback_location: profile_path)
  end

  def unfollow
    current = Follower.find_by(user_id: current_user.id, following_id: params[:user])
    if current.destroy
      flash[:success] = "Unfollowed successfully"
    else
      flash[:error] = "unfollow request couldn't be made"
    end   
    redirect_back(fallback_location: profile_path) 
  end

  def read
    notification = Notification.find(params[:id])
    notification.update_attribute(:read, true)
    redirect_back(fallback_location: profile_path) 
  end

end
