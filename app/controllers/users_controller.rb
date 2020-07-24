class UsersController < ApplicationController

    def create
        @user = User.create(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @shoe.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        user = User.find(params[:id]) 
        user.destroy
        redirect_to eateries_path
    end

    def show
    end

    def login
    end

    def logout
    end

    private

    def user_params
        params.require(:user).permit(:username, :first_name, :last_name, :email, :password_digest)
    end
end
