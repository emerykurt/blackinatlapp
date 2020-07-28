class AddEateryToRating < ActiveRecord::Migration[6.0]
  def change
    add_reference :ratings, :eatery, null: false, foreign_key: true
  end
end
