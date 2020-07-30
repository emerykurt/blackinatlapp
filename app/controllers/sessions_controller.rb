class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def login
    end

    def omniauth
        user = User.create_from_omniauth(auth)
        if user.valid?
            session[:user_id] = user.id
            redirect_to user_path(current_user)
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to sessions_login_path
        end
    end

    def create
        @user = User.find_by_username(params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
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

    private
    def auth
        request.env['omniauth.auth']
    end

end
