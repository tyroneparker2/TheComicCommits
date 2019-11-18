class PagesController < ApplicationController
  skip_before_action :authorized, only: [:homepage]
  def homepage
    respond_to do |format|
      format.html { render :homepage }
    end
  end
end
