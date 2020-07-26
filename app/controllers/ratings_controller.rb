class RatingsController < ApplicationController
    
    def create
        average = ((rating_params[:customer_service]).to_i + (rating_params[:product_quality]).to_i + (rating_params[:checkout_experience]).to_i + (rating_params[:overall_experience]).to_i) / 4
        @rating = Rating.create(rating_params.merge(:average => average))
        if session[:user_id] = @rating.user_id
            @rating.save
            redirect_to rating_path(@rating)
        else
            render :new
        end
    end

    def new
        @rating = Rating.new
    end

    def edit
        @rating = Rating.find(params[:id])
    end

    def show
        @rating = Rating.find(params[:id])
        @rating.update(user_params)
        redirect_to rating_path(@rating)
    end

    private

    def rating_params
        params.require(:rating).permit(:user_id, :price_point, :customer_service, :product_quality, :checkout_experience, :overall_experience, :average)
    end
end
