class ComicsController < ApplicationController
  def index
    comics = Comic.all
    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    comic = Comic.find(params[:id])
    respond_to do |format|
      format.html { render :index }
    end
  end
end
