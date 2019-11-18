class ApplicationController < ActionController::Base
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
    helper_method :name
    def current_user
      if session[:user_id]
        @current_user ||= User.find(session[:user_id])
      else
        @current_user = nil
      end
    end
    def logged_in?
        !current_user.nil?
    end
    def authorized
        redirect_to login_path unless logged_in?
    end
    def name(id)
      @value ||= User.find(id)
      return @value.username
    end
end
