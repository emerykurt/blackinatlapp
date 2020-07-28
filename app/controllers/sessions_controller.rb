class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def login
    end

    def create
        @user = User.find_by_username(user_params[:username])
        if @user && @user.authenticate(user_params[:password])
            session[:user_id] = @user.id
            redirect_to "/users/#{@user.id}"
        else
            redirect_to '/sessions/login'
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to '/welcome'
    end

    def page_requires_login
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end

end
