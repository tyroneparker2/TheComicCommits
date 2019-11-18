class PagesController < ApplicationController
  def homepage
    respond_to do |format|
      format.html { render :homepage }
    end
  end
end
