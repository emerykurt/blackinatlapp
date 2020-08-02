class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :eatery
    validates :customer_service, presence: true
    validates :product_quality, presence: true
    validates :checkout_experience, presence: true
    validates :overall_experience, presence: true

    scope :expensive, -> {where(price_point: "true")}
    def self.expensive
    where(price_point: "true")
    end

    scope :affordable, -> {where(price_point: "false")}
    def self.affordable
    where(price_point: "false")
    end

    def price
        if self.price_point == true
            "Yes"
        else
            "No"
        end 
    end

    def self.avg(rating_params)
        average = ((rating_params[:customer_service]).to_i + (rating_params[:product_quality]).to_i + (rating_params[:checkout_experience]).to_i + (rating_params[:overall_experience]).to_i) / 4
    end

    # scope :budget, -> (price_point) {where("price_point LIKE ?", price_point)
    # def budget(price_point)
    #     where("price_point LIKE ?", price_point)
    # end

    def self.order_by_avg
        self.order(average: :desc)
    end
end
