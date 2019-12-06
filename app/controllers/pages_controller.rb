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
    comics = comics.order('created_at DESC')
    respond_to do |format|
      format.html { 
        if user.id == current_user.id
          redirect_to profile_path
        else  
          render :show_profile, locals: { user: user, comics: comics }
        end 
      }
    end
  end

  def discover
    comics = Comic.all
    comics = comics.order('created_at DESC')
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
          results = User.all.where("lower(username) LIKE ?", "%#{parameter}%")
          render :user_search, locals: { results: results }
        end 
      }
    end
  end

  def comic_search
    respond_to do |format|
      format.html {
        if params[:search].blank?
          flash[:error] = "Search box can not be blank"
          redirect_to discover_path 
        else
          parameter = params[:search].downcase
          if params[:genre] == 'All'
            results = Comic.all.where("lower(title) LIKE ?", "%#{parameter}%")
            results = results.order('created_at DESC')
            render :comic_search, locals: { results: results }
          else
            results = Comic.all.where("lower(title) LIKE ? and genre = ?", "%#{parameter}%", params[:genre])
            results = results.order('created_at DESC')
            render :comic_search, locals: { results: results }
          end
        end 
      }
    end
  end
end
