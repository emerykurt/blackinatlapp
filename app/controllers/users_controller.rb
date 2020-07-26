class UsersController < ApplicationController
    

    
    def create
        byebug
        @user = User.create(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to '/welcome'
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
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        user = User.find(params[:id]) 
        user.destroy
        redirect_to eateries_path
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:id, :username, :first_name, :last_name, :email, :password)
    end
end
