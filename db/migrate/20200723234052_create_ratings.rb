class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :eatery_id
      t.boolean :price_point
      t.integer :customer_service
      t.integer :product_quality
      t.integer :checkout_experience
      t.integer :overall_experience
      t.integer :average

      t.timestamps
    end
  end
end
