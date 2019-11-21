class PagesController < ApplicationController
  skip_before_action :authorized, only: [:homepage]
  def homepage
    respond_to do |format|
      format.html { render :homepage }
    end
  end

  def show_profile
    user = User.find_by(username: params[:username])
    respond_to do |format|
      format.html { render :show_profile, locals: { user: user } }
    end
  end
end
