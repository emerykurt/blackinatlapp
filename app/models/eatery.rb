class Eatery < ApplicationRecord

    def name_neighborhood
        "#{self.name} - #{self.neighborhood}"
    end
end
