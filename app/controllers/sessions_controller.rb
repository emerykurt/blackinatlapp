class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:new, :create, :welcome, :login]

    def login
    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            sessions[:user_id] = @user.id
            redirect_to '/welcome'
        else
            render :render
        end
    end

    def logout
    end

    def page_requires_login
    end
end