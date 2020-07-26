class SessionsController < ApplicationController


    def welcome
       
    end

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

    def logout
        session[:user_id] = nil
        redirect_to '/welcome', notice: "Logged out!"
    end

    def page_requires_login
    end


end
