class RatingsController < ApplicationController
    before_action :authorized

    def new 
        @eatery = Eatery.find_by_id(params[:eatery_id])
        @rating = Rating.new
    end

    def create
        @rating = Rating.create(rating_params)
        @rating.user_id = session[:user_id]
        @rating.average = Rating.avg(rating_params) 
        if @rating.save     
            redirect_to "/ratings/#{@rating.id}"   
        else
            render :new
        end
    end

    def expensive_eateries
        @eats = Rating.all.expensive
    end

    def cheap_eateries
        @eats = Rating.all.affordable
    end

    def index
        if params[:user_id] == session[:user_id].to_s && @user = User.find_by_id(params[:user_id])
            @ratings = @user.ratings.order_by_avg
            @list = @ratings.all
        else
            redirect_to user_path(current_user)
        end
    end

    def edit
        @rating = Rating.find(params[:id])
    end

    def update
        @rating = Rating.find(params[:id])
        @rating.average = Rating.avg(rating_params) 
        @rating.update(rating_params)
        redirect_to rating_path(@rating)
    end

    def show
        @rating = Rating.find_by_id(params[:id])
    end

    def destroy
        rating = Rating.find(params[:id]) 
        rating.destroy
        redirect_to "/users/#{current_user.id}/ratings"
    end


    private

    def rating_params
        params.require("rating").permit(:authenticity_token, :eatery_id, :price_point, :customer_service, :product_quality, :checkout_experience, :overall_experience, :average, :commit)
    end
end
