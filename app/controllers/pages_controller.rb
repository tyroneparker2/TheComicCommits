class PagesController < ApplicationController
  skip_before_action :authorized, only: [:homepage]
  def homepage
    respond_to do |format|
      format.html { render :homepage }
    end
  end

  def show_profile
    user = User.find_by(username: params[:username])
    comics = Comic.where(user_id: user.id).all 
    respond_to do |format|
      format.html { render :show_profile, locals: { user: user, comics: comics } }
    end
  end

  def discover
    comics = Comic.all
    respond_to do |format|
      format.html { render :discover, locals: { comics: comics } }
    end
  end

  def user_search
    respond_to do |format|
      format.html {
        if params[:search].blank?
          flash[:error] = "Search box can not be blank"
          redirect_to profile_path 
        else
          parameter = params[:search].downcase  
          results = User.all.where("lower(username) LIKE :search", search: "%#{parameter}%")
          render :user_search, locals: { results: results }
        end 
      }
    end
  end
end
