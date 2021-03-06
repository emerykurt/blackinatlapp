class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    before_action :authorized, only: [:create, :edit, :update, :destroy]
    protect_from_forgery with: :exception

    def current_user    
        User.find_by(id: session[:user_id])  
    end

    def logged_in? 
        !current_user.nil?  
    end

    def authorized
        redirect_to welcome_path unless logged_in?
     end
end
