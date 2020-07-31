class EateriesController < ApplicationController


  def index
    @eateries = Eatery.all
  end

  def show
    @eatery = Eatery.find(params[:id])
  end

  # def live_search
  #   @eatery = Eatery.find_latest params[:q]
  #   render :layout => false
  # end

end
