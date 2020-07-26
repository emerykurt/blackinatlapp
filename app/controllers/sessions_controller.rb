class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def login
    end

    def create

        @user = User.find_by(params[:username])
        if @user && @user.authenticate(params[:password])
            sessions[:user_id] = @user.id
            redirect_to "/users/#{@user.id}"
        else
            flash.now.alert = "Invalid email or password"
            redirect_to '/sessions/login'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/welcome'
    end

    def page_requires_login
    end
end
