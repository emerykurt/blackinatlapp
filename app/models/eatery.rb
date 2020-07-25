class Eatery < ApplicationRecord
    has_many :ratings
    has_many :users, through: :ratings 

    def name_neighborhood
        "#{self.name} - #{self.neighborhood}"
    end
end
