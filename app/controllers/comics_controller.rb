class ComicsController < ApplicationController
    def comic
        respond_to do |format|
          format.html{ render :comic }
        end
    end

    def set_comic
    user = User.find(current_user.id)
        user.comic_file.purge 
        user.comic_file.attach(params[:comic_file])
        respond_to do |format|
          format.html {
            if user.save
                flash.now[:success] = "Comic saved successfully"
            else
                flash.now[:error] = "Request didn't saved successfully"
            end
            render :comic
            }
        end  
    end   
end
