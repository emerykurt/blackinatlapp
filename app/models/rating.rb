class Rating < ApplicationRecord
    belongs_to :user
    belongs_to :eatery

    def self.order_by_avg
        self.order(average: :desc)
    end
end
