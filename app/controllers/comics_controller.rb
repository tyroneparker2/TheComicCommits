class ComicsController < ApplicationController
    def comic
        comic = Comic.new
        respond_to do |format|
          format.html{ render :comic, locals: { comic: comic } }
        end
    end

    def set_comic
        comic = Comic.new(params.require(:comic).permit(:title, :genre, :category))
        wrong = Comic.new(params.require(:comic).permit(:title, :genre))
        comic.user_id = current_user.id
        comic.cover_file.attach(params[:comic][:cover_file])
        comic.comic_file.attach(params[:comic][:comic_file])
        respond_to do |format|
          format.html {
            if params[:comic][:cover_file].present? && params[:comic][:comic_file].present?
                if params[:comic][:category] == 'series'
                    if params[:comic][:series_answer] == 'yes'
                        if params[:comic][:isbn].present?
                            @new_title = params[:comic][:series_name] + " #" + params[:comic][:isbn]
                            series = Series.find_by(title: params[:comic][:series_name])
                            if series && (series.user_id == current_user.id || series.user_id == 1)
                                comic.series_id = series.id
                                comic.title = @new_title
                                if comic.save
                                    flash[:success] = "Comic saved successfully"
                                    message = current_user.username + " has created a comic called " + comic.title
                                    redirect_to create_notification_path(message: message)
                                else
                                    flash.now[:error] = "Comic couldn't be saved"
                                    render :comic, locals: { comic: wrong }
                                end 
                            else
                                flash.now[:error] = "Your Series couldn't be find"
                                render :comic, locals: { comic: wrong }
                            end 
                        else
                            flash.now[:error] = "Isbn is required"
                            render :comic, locals: { comic: wrong }
                        end    
                    elsif params[:comic][:series_answer] == 'no'
                        if params[:comic][:isbn].present?
                            @new_title = params[:comic][:series_name] + " #" + params[:comic][:isbn]
                            series = Series.new(title: params[:comic][:series_name])
                            series.user_id = current_user.id
                            if series.save
                                comic.series_id = series.id
                                comic.title = @new_title
                                if comic.save
                                    flash[:success] = "Series and Comic saved successfully"
                                    message = current_user.username + " has created a comic called " + comic.title
                                    redirect_to create_notification_path(message: message)
                                else
                                    flash.now[:error] = "Series saved but Comic couldn't be saved"
                                    render :comic, locals: { comic: wrong }
                                end            
                            else
                                flash.now[:error] = "Series Name is taken"
                                render :comic, locals: { comic: wrong } 
                            end
                        else
                            flash.now[:error] = "Isbn is required"
                            render :comic, locals: { comic: wrong }
                        end      
                    else
                        flash.now[:error] = "Series Exist answer is required"
                        render :comic, locals: { comic: wrong } 
                    end    
                else
                    comic.series_id = 1
                    if comic.save
                        flash[:success] = "Comic saved successfully"
                        message = current_user.username + " has created a comic called " + comic.title
                        redirect_to create_notification_path(message: message)
                    else    
                        flash.now[:error] = "Comic couldn't be saved"
                        render :comic, locals: { comic: wrong } 
                    end
                end    
            else
                flash.now[:error] = "Cover Page and Comic Page are requried"
                render :comic, locals: { comic: wrong } 
            end
            }
        end  
    end
    
    def edit_comic
        comic = Comic.find(params[:id])
        respond_to do |format|
          format.html{ render :edit, locals: { comic: comic } }
        end
    end

    def view_comic
        comic = Comic.find_by(title: params[:title])
        respond_to do |format|
          format.html{ render :view, locals: { comic: comic } }
        end
    end

    def change_comic
        comic = Comic.find(params[:id])
        comic.title = params[:comic][:title]
        comic.genre = params[:comic][:genre]
        if params[:comic][:cover_file].present?        
            comic.cover_file.purge
            comic.cover_file.attach(params[:comic][:cover_file])
        end   
        if params[:comic][:comic_file].present?        
            comic.comic_file.purge
            comic.comic_file.attach(params[:comic][:comic_file])
        end    
        respond_to do |format|
          format.html{
            if comic.save
                flash[:success] = "Comic saved successfully"
                redirect_to profile_path
            else
                flash.now[:error] = "Comic could not be saved"
                render :edit, locals: { comic: comic }
            end
            }
        end
    end

    def delete_comic  
        Comic.destroy(params[:id])
        flash[:success] = "Comic was Deleted"  
        redirect_to profile_path  
    end
end
