class RegisterController < ApplicationController
    skip_before_action :authorized, only: [:new_user, :create]
    def new_user
        user = User.new
        respond_to do |format|
          format.html { render :new_user, locals: { user: user } }
        end
    end

    def create
        user = User.new(params.require(:user).permit(:username, :password, :password_confirmation, :email))
        respond_to do |format|
          format.html {
            if user.save
              flash[:success] = "Account was created"
              session[:user_id] = user.id
              redirect_to profile_path
            else
              flash.now[:error] = "Account could not be created"
              render :new_user, locals: { user: user }
            end
          }
        end
    end
    
end
