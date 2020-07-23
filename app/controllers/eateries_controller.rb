class EateriesController < ApplicationController
  def index
    @eateries = Eatery.all
  end

  # def live_search
  #   @eatery = Eatery.find_latest params[:q]
  #   render :layout => false
  # end

  def show
    @eatery = Eatery.find(params[:id])
  end

  def favorite_eateries
    #show top 5 ratings
  end
end
