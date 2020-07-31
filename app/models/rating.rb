class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :eatery

    scope :expensive, -> {where(price_point: "true")}
    def self.expensive
    where(price_point: "true")
    end

    scope :affordable, -> {where(price_point: "false")}
    def self.affordable
    where(price_point: "false")
    end

    # scope :budget, -> (price_point) {where("price_point LIKE ?", price_point)
    # def budget(price_point)
    #     where("price_point LIKE ?", price_point)
    # end

    def self.order_by_avg
        self.order(average: :desc)
    end
end
