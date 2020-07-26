class EateriesController < ApplicationController
  

  def index
    @eateries = Eatery.all
  end

  def show
    @eatery = Eatery.find(params[:id])
  end

  def favorite_eateries
    #show top 5 ratings
  end

  def expensive_eateries
    #show expensive spots based upon ratings
  end

  def cheap_eateries
    #show cheap eateries based upon ratings
  end

  # def live_search
  #   @eatery = Eatery.find_latest params[:q]
  #   render :layout => false
  # end

end
